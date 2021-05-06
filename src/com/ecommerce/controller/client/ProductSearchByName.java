package com.ecommerce.controller.client;

import java.io.IOException;
import java.util.Comparator;
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
	ProductService productService = new ProductServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("pname");

		System.out.println(name);
		List<Product> results = productService.searchProductByName(name);

		List<Product> lowPrice = productService.searchProductByName(name);
		lowPrice.sort(new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				if (o1.getProductPrice() > o2.getProductPrice())
					return 1;
				if (o1.getProductPrice() < o2.getProductPrice())
					return -1;
				return 0;
			}
		});

		List<Product> highPrice = productService.searchProductByName(name);
		highPrice.sort(new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				if (o1.getProductPrice() < o2.getProductPrice())
					return 1;
				if (o1.getProductPrice() > o2.getProductPrice())
					return -1;
				return 0;
			}

		});

		req.setAttribute("results", results);
		req.setAttribute("lowPrice", lowPrice);
		req.setAttribute("highPrice", highPrice);
		req.setAttribute("pname", name);
		req.getRequestDispatcher("/view/customer/product-search-by-name.jsp").forward(req, resp);

	}

}