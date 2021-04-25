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

@WebServlet("/customer/product/category")
public class ProductSearchByCategory extends HttpServlet {
	ProductService productService=new ProductServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int categoryID = Integer.parseInt(req.getParameter("id"));
		List<Product> searchProductByCategory =productService.searchProductByCategory(categoryID);
		req.setAttribute("searchProductByCategory", searchProductByCategory);
		req.getRequestDispatcher("view/customer/productSeachByCategory.jsp").forward(req, resp);
		
	}
}
