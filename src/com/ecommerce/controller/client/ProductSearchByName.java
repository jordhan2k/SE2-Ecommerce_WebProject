package com.ecommerce.controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.impl.ProductServiceImpl;

@WebServlet("/customer/product/name")
public class ProductSearchByName extends HttpServlet {
	ProductService productService=new ProductServiceImpl();
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String name=req.getParameter("productName");
		List<Product> productSeachByName =productService.searchProductByName(name);
		req.setAttribute("productSeachByName", productSeachByName);
		req.getRequestDispatcher("/view/customer/product-seach-by-name.jsp").forward(req, resp);
		
	}

}
