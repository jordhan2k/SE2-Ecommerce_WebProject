package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Product;

/**
 * @overview ProductDAO is an abstract interface which facilitates communication to
 *           Product table in database.
 *           
 * @author TMDuong
 */

public interface ProductDAO {
	void insertProduct(Product product);

	boolean updateProduct(Product product);

	boolean deleteProduct(int productID);

	Product getProductByID(int productID);

	List<Product> getAllProducts();

	List<Product> searchProductByName(String productName);
	
	List<Product> searchProductByCategory(int categoryID);
}