package com.ecommerce.controller.client;

import java.io.IOException;
import java.sql.Date;
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
import com.ecommerce.model.User;
import com.ecommerce.model.Voucher;
import com.ecommerce.service.CartLineService;
import com.ecommerce.service.CartService;
import com.ecommerce.service.UserService;
import com.ecommerce.service.VoucherService;
import com.ecommerce.service.impl.CartLineServiceImpl;
import com.ecommerce.service.impl.CartServiceImpl;
import com.ecommerce.service.impl.UserServiceImpl;
import com.ecommerce.service.impl.VoucherServiceImpl;

@WebServlet("/customer/checkout")
public class CheckoutServlet extends HttpServlet {
	CartService cartService = new CartServiceImpl();
	CartLineService cartLineService = new CartLineServiceImpl();
	UserService userService = new UserServiceImpl();
	VoucherService voucherService = new VoucherServiceImpl();

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
//		Voucher voucher = (Voucher) req.getAttribute("voucher");
		Voucher voucher = voucherService.getVoucherByID(100000);
		
		System.out.println(paymentMode);

		if (paymentMode.equals("PayPal")) { // handle online payment with pay pal

			
			
			
			
		}

		else {
			
			Cart cart = new Cart();
			cart.setUser(account);
			cart.setOrderDate(new Date(System.currentTimeMillis()));
			cart.setStatus("Checkout");
			cart.setPayment(paymentMode);
			cart.setVoucher(voucher);

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
			System.out.println(cartID);
			session.removeAttribute("cart");
			req.setAttribute("placed-id", cartID);
			RequestDispatcher rd = req.getRequestDispatcher("/view/customer/checkout-succeed.jsp");
			rd.forward(req, resp);

		}

	}

}
