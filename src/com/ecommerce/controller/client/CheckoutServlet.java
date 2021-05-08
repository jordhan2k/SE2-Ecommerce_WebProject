package com.ecommerce.controller.client;

import java.io.IOException;
import java.sql.Date;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;
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
	NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
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

		String subTotal = req.getParameter("subtotal");
		String discount = req.getParameter("discount");
		String total = req.getParameter("total");
		String paymentMode = req.getParameter("paymentMode");
		String voucherID = req.getParameter("voucherID");

		Voucher voucher = voucherService.getVoucherByID(Integer.parseInt(voucherID));

		System.out.println(subTotal);
		System.out.println(discount);
		System.out.println(total);
		System.out.println(voucherID);
		System.out.println(paymentMode);

		if (paymentMode.equals("PayPal")) { // handle online payment with pay pal

			Object temporaryCart = req.getSession().getAttribute("cart");
			Map<Integer, CartLine> map = (Map<Integer, CartLine>) temporaryCart; // keep
			try {
				// TEST

//				Product pr1 = productService.getProductByID(100010);
//				Product pr2 = productService.getProductByID(100011);
//				CartLine line1 = new CartLine(2, 20000, pr1, null); // test
//				CartLine line2 = new CartLine(2, 20000, pr2, null); // test
//
//				Map<Integer, CartLine> map = new HashMap<Integer, CartLine>();
//				map.put(1, line1);
//				map.put(2, line2);
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
			cart.setStatus("Pending");
			cart.setPayment(paymentMode);
			cart.setVoucher(voucher);
			cart.setTotal(Long.parseLong(total) + 30000);

			// get inserted cartID
			int cartID = cartService.insertCart(cart);

			cart = cartService.getCartById(cartID);

			Object temporaryCart = session.getAttribute("cart");
			String message = "<p>Your order - <b>#" + cartID + "</b> has been successfully placed. <br>"
					+ " The chosen payment method is <b>" + cart.getPaymentMode() + "</b>. <br>"
					+ "The total charge is " + nf.format(cart.getTotal()) + " VND.<br>"
					+ "Please be noticed! </p> <hr>";

			String orderDetail = "<h3>Order detail - #"+ cart.getCartID() +"</h3> <br> "
					+ "<table style=\"width: 100%;\">"
					+ "<thead>"
					+ "<th style=\"width:50%; text-align: left;\">Product name</th>"
					+ "<th style=\"width:20%; text-align: left;\">Price</th>"
					+ "<th style=\"width:10%; text-align: left;\">Quantity</th>"
					+ "<th style=\"width:20%; text-align: left;\">Subtotal</th>"
					+ "</thead>"
					+ "<tbody>";

			if (temporaryCart != null) {

				Map<Integer, CartLine> map = (Map<Integer, CartLine>) temporaryCart;

				for (CartLine cartLine : map.values()) {
					
					orderDetail += "<tr>"
							+ "<td>"+ cartLine.getProduct().getProductName()+"</td>"
							+ "<td>" + nf.format(cartLine.getUnitPrice() )+"</td>"
							+ "<td> "+ cartLine.getQuantity()+"</td>"
							+ "<td>"+ nf.format(cartLine.getQuantity() * cartLine.getUnitPrice())+"</td>"
							+ "</tr>";
					
					
					
					cartLine.setCart(cart);
					cartLineService.insertCartLine(cartLine);
				}
			}

			orderDetail += "</tbody></table>"
					+ "<hr>"
					+ "<p>Total : "+ nf.format(Long.parseLong(subTotal))+" VND<br>"
					+ "Shipping fee: 30.000VND<br>"
					+ "Discount with voucher: -"+ nf.format(Long.parseLong(discount))+" VND<br>"
					+ "Final total: "+nf.format(cart.getTotal())+" VND</p><hr>"
					+ "<p>Please contact us if any inconveniences come up!<br>"
					+ "Best regards,<br>"
					+ "<b>Lapeki Ecommerce &copy;</b></p>";

			MailTools mailTools = new MailTools();

			try {

				mailTools.sendMail(account.getEmail(), "Lapeki - Order placed successfully", message + orderDetail);
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

	public static void main(String[] args) {

	}

}
