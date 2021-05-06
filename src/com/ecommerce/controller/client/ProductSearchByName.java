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

@WebServlet("/product/search")
public class ProductSearchByName extends HttpServlet {
	ProductService productService=new ProductServiceImpl();
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String name=req.getParameter("productName");
		
		System.out.println(name);
		List<Product> productSearchByName =productService.searchProductByName(name);
		req.setAttribute("productSearchByName", productSearchByName);
		req.getRequestDispatcher("/view/customer/product-search-by-name.jsp").forward(req, resp);
		
		
	}

}