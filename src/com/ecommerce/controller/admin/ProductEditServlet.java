package com.ecommerce.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ecommerce.model.Category;
import com.ecommerce.model.Product;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.impl.CategoryServiceImpl;
import com.ecommerce.service.impl.ProductServiceImpl;

/**
 * @overview ProductEditServlet is a servlet used to handle the use case of
 *           editing a product.
 * @author Dung HT
 *
 */
public class ProductEditServlet extends HttpServlet {
	ProductService productService = new ProductServiceImpl();
	CategoryService categoryService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int productID = Integer.parseInt(req.getParameter("productID"));

		Product product = productService.getProductByID(productID);

		List<Category> categories = categoryService.getAllCategories();

		req.setAttribute("product", product);
		req.setAttribute("categories", categories);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/admin/product-edit.jsp");

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Product product = new Product();
		// Create a factory for disk-based file items
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		// Create a new file upload handler
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);

		try {
			// parse the request to fileItems
			List<FileItem> items = servletFileUpload.parseRequest(req);

			for (FileItem item : items) {
				if (item.getFieldName().equals("productID")) {
					product.setProductID(Integer.parseInt("productID"));
				} else if (item.getFieldName().equals("productName")) {
					product.setProductName(item.getString());

				} else if (item.getFieldName().equals("productPrice")) {
					product.setProductPrice(Long.parseLong(item.getString()));

				} else if (item.getFieldName().equals("instock")) {
					product.setInstock(Integer.parseInt(item.getString()));

				} else if (item.getFieldName().equals("productDesc")) {
					product.setProductDesc(item.getString());

				} else if (item.getFieldName().equals("category")) {
					product.setCategory(categoryService.getCategoryByID(Integer.parseInt(item.getString())));

				} else if (item.getFieldName().equals("productImg")) {
					final String directory = "F:\\upload";
					// get the original name of uploaded image file
					String originalFileName = item.getName();
					// get extension of the file
					int index = originalFileName.lastIndexOf(".");
					String extension = originalFileName.substring(index);
					// new file name
					String fileName = System.currentTimeMillis() + "." + extension;
					File file = new File(directory + "/" + fileName);
					item.write(file);
					product.setProductImg(fileName);

				}
				productService.updateProduct(product);

				resp.sendRedirect(req.getContextPath() + "/admin/product/list");

			}

		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
