package com.ecommerce.controller.client;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.Cart;
import com.ecommerce.model.CartLine;
import com.ecommerce.model.Product;
import com.ecommerce.model.User;
import com.ecommerce.model.Voucher;
import com.ecommerce.payment.PayPalService;
import com.ecommerce.service.CartLineService;
import com.ecommerce.service.CartService;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.UserService;
import com.ecommerce.service.VoucherService;
import com.ecommerce.service.impl.CartLineServiceImpl;
import com.ecommerce.service.impl.CartServiceImpl;
import com.ecommerce.service.impl.ProductServiceImpl;
import com.ecommerce.service.impl.UserServiceImpl;
import com.ecommerce.service.impl.VoucherServiceImpl;
import com.ecommerce.tools.MailTools;
import com.paypal.base.rest.PayPalRESTException;

@WebServlet("/customer/checkout")
public class CheckoutServlet extends HttpServlet {
	CartService cartService = new CartServiceImpl();
	CartLineService cartLineService = new CartLineServiceImpl();
	UserService userService = new UserServiceImpl();
	VoucherService voucherService = new VoucherServiceImpl();
	ProductService productService = new ProductServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/view/customer/checkout.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		User account = (User) session.getAttribute("account");

		String paymentMode = req.getParameter("paymentMode");
		String voucherID = req.getParameter("voucher");
		System.out.println();

		System.out.println(paymentMode);

		if (paymentMode.equals("PayPal")) { // handle online payment with pay pal

			Object temporaryCart = req.getSession().getAttribute("cart");
//			Map<Integer, CartLine> map = (Map<Integer, CartLine>) temporaryCart; // keep
			try {
				// TEST

				Product pr1 = productService.getProductByID(100010);
				Product pr2 = productService.getProductByID(100011);
				CartLine line1 = new CartLine(2, 20000, pr1, null); // test
				CartLine line2 = new CartLine(2, 20000, pr2, null); // test

				Map<Integer, CartLine> map = new HashMap<Integer, CartLine>();
				map.put(1, line1);
				map.put(2, line2);
				// TEST ends

				for (CartLine line : map.values()) {
					System.out.println(line.toString());
				}

				PayPalService payPalService = new PayPalService();
				String approvalLink = payPalService.authorizePayment(map);
				System.out.println(approvalLink);
				resp.sendRedirect(approvalLink);
			} catch (PayPalRESTException ex) {
				req.setAttribute("errorMessage", ex.getMessage());
				ex.printStackTrace();
				req.getRequestDispatcher("/view/error-pages/error.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		else {

			Cart cart = new Cart();
			cart.setUser(account);
			cart.setOrderDate(new Date(System.currentTimeMillis()));
			cart.setStatus("Checkout");
			cart.setPayment(paymentMode);
//			cart.setVoucher(voucher);

			// get inserted cartID
			int cartID = cartService.insertCart(cart);

			cart = cartService.getCartById(cartID);

			Object temporaryCart = session.getAttribute("cart");

			if (temporaryCart != null) {

				Map<Integer, CartLine> map = (Map<Integer, CartLine>) temporaryCart;

				for (CartLine cartLine : map.values()) {
					cartLine.setCart(cart);
					cartLineService.insertCartLine(cartLine);
				}
			}

			MailTools mailTools = new MailTools();

			try {
				mailTools.sendMail(account.getEmail(), "Lapeki - Order placed successfully",
						"Your order - #" + cartID + " has been successfully placed.\n"
								+ " The chosen payment method is " + cart.getPaymentMode() + " . "
								+ "Please be noticed!");
			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println(cartID);
			session.removeAttribute("cart");
			req.setAttribute("placed-id", cartID);
			RequestDispatcher rd = req.getRequestDispatcher("/view/customer/checkout-succeed.jsp");
			rd.forward(req, resp);

		}

	}

}
