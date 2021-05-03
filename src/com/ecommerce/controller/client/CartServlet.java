package com.ecommerce.controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.Voucher;
import com.ecommerce.service.VoucherService;
import com.ecommerce.service.impl.VoucherServiceImpl;

@WebServlet("/customer/cart")
public class CartServlet extends HttpServlet{
	VoucherService voucherService = new VoucherServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Voucher> list = voucherService.getAllVouchers();
		System.out.println(list.size());
		req.setAttribute("vouchers", list);
		
		HttpSession httpSession = req.getSession();
		Object object = httpSession.getAttribute("cart");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/customer/list-cart.jsp");
		dispatcher.forward(req, resp);
	}
}
