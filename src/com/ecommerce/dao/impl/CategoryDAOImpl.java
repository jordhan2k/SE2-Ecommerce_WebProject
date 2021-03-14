package com.ecommerce.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.connection.DatabaseConnection;
import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.model.Category;

/**
 * @overview CategoryDAOImpl is an abstract interface which facilitates 
 * 			 communication to Category table in database.
 * @author Tus
 */
public class CategoryDAOImpl implements CategoryDAO {
	Connection connection = DatabaseConnection.getConnection();
	
	/**
	 * 	Insert a new Category to database
	 * 
	 * @param category - a new category
	 */
	@Override
	public void inserCategory(Category category) {
		String sql = "INSERT INTO category(category_name) VALUES (?)";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, category.getCategoryName());
			ps.executeUpdate();
			
			ps.close();
			connection.close();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
	}
	
	/**
	 * 	Update an existing Category in the database
	 * 
	 * @param category - a category to be updated in the database
	 * @return true if category is updated, false if not
	 */
	@Override
	public boolean updateCategory(Category category) {
		boolean isUpdated = false;
		String sql = "UPDATE category SET category_name = ? where category_id = ?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, category.getCategoryName());
			ps.setInt(2, category.getCategoryID());
			
			isUpdated = ps.executeUpdate() > 0;
			
			ps.close();
			connection.close();
			
 		} catch (Exception e) {
 			System.err.println(e.getMessage());
 		}
		return isUpdated;
	}
	
	/**
	 * 	Delete an existing Category 
	 *
	 * @param categoryID - the id of the category to be deleted
	 * @return true if the category is deleted, or false if not
	 */
	@Override
	public boolean deleteCategory(int categoryID) {
		boolean isDeleted = false;
		String sql = "DELETE FROM category WHERE category_id = ?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, categoryID);
			
			isDeleted = ps.executeUpdate() > 0;
			
			ps.close();
			connection.close();
 		} catch (Exception e) {
 			System.err.println(e.getMessage());
 		}
		return isDeleted;
	}
	
	/**
	 * 	Get an category from database by its categoryID
	 * 
	 * @param categoryID - the id of desired Category
	 * @return Either the desired Category if found or null if not 
	 */
	@Override
	public Category getCategoryByID(int categoryID) {
		String sql = "SELECT * FROM category WHERE category_id = ?";
		Category category = null;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, categoryID);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String categoryName = rs.getString("category_name");
				category = new Category(categoryID, categoryName);
				
				ps.close();
				connection.close();
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return category;
	}
	
	/**
	 * 	Get an CartLine from database by its categoryName
	 * 
	 * @param categoryName - the name of desired Category
	 * @return Either the desired Category if found or null if not 
	 */
	@Override
	public Category getCategoryByName(String categoryName) {
		String sql = "SELECT * FROM category WHERE category_name = ?";
		Category category = null;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, categoryName);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int categoryID = rs.getInt("category_id");
				category = new Category(categoryID, categoryName);
				
				ps.close();
				connection.close();
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return category;
	}
	
	/**
	 * 	Get all Categories that exist in the database 
	 * 	@return Either the list of Categories or null if there is no Category
	 */
	@Override
	public List<Category> getAllCategories() {
		List<Category> list = new ArrayList<Category>();
		Category category = null;
		String sql = "SELECT * FROM category";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int categoryID = rs.getInt("category_id");
				String categoryName = rs.getString("category_name");
				category = new Category(categoryID, categoryName);
				
				list.add(category);
				
				ps.close();
				connection.close();
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
	
	/**
	 * Search for a Category by name
	 * 
	 * @param categoryName - the name to be searched for 
	 * @return Either the list of matching result or null if there is no matches
	 */
	@Override
	public List<Category> searchCategoryByName(String categoryName) {
		List<Category> list = new ArrayList<Category>();
		Category category = null;
		String sql = "SELECT * FROM category WHERE category_name LIKE ?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "%" + categoryName + "%");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int categoryID = rs.getInt("category_id");
				category = new Category(categoryID, categoryName);
				
				list.add(category);
				
				ps.close();
				connection.close();
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
	
}
