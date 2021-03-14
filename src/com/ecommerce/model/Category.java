package com.ecommerce.model;

import java.io.Serializable;


/**
 * @overview 
 *  Category is uses to sort products in different type
 *  
 * @attributes
 * <pre>
 * categoryID   Integer int
 * categoryName String
 * </pre>
 * 
 * @abstract_properties
 * mutable(categoryID)=false /\ optional(categoryID)=false /\
 * mutable(categoryName)=false /\ optional(categoryName)=false
 * 
 * @author TMDuong
 *
 */

public class Category implements Serializable {
	private int categoryID;
	private String categoryName;

	public Category() {
	}

	public Category(int categoryID, String categoryName) {
		super();
		this.categoryID = categoryID;
		this.categoryName = categoryName;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}