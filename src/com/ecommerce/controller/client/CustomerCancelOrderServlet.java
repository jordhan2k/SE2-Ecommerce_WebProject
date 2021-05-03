package com.ecommerce.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.service.CartService;
import com.ecommerce.service.impl.CartServiceImpl;

@WebServlet("/customer/order/cancel")
public class CustomerCancelOrderServlet extends HttpServlet {
	CartService cartService = new CartServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));

		cartService.updateCartStatus(id, "Canceled");

		resp.sendRedirect(req.getContextPath() + "/customer/order/detail?id=" + id);

	}

}
