package com.ecommerce.model;

/**
 * @overview
 *   <pre>
 *   Product is a book which is represented by id,name,img,price, categoryid, instock and description
 *   </pre>
 * @attributes
 * 	<pre>
 * 		productId   Integer int
 * 		productName       String
 * 		productImg        String
 * 		price             long  
 * 		Category 
 * 		instock     Integer int
 * 		productDesc       String
 * 	</pre>
 * @abstract_properties
 *   <pre> 
 *   mutable(productId)= false /\ optional(productId)= false /\ min(productId)= 100000/\length(productId) = 6
 *	 mutable (productName)= false /\ optional(productName)= false /\ length(productName)= 25
 *	 mutable (productImg)= true/\ optional(productImg)=false /\ length(productImg)= 2000
 *	 mutable (productPrice)= true /\ optional(productPrice)= false
 *   mutable (instock) = true /\ optional (instock) = false
 *   mutable (productDesc)= true /\optional (productDesc)= false /\ length(productDesc) =2000
 * 
 *
 * </pre>
 * @author ThanhTra
 *
 */

public class Product {
	protected int productId; 
	protected String productName;
	protected String productImg; 
	protected long productPrice;
	private  Category category;
	protected int instock;
	protected String productDesc;
	/**
	 * 
	 */
	public Product() {
		super();
	}
	public Product(int productId, String productName, String productImg, long productPrice, Category category,
			int instock, String productDesc) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImg = productImg;
		this.productPrice = productPrice;
		this.category = category;
		this.instock = instock;
		this.productDesc = productDesc;
	}
	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}
	/**
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}
	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
	/**
	 * @return the productImg
	 */
	public String getProductImg() {
		return productImg;
	}
	/**
	 * @param productImg the productImg to set
	 */
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	/**
	 * @return the productPrice
	 */
	public long getProductPrice() {
		return productPrice;
	}
	/**
	 * @param productPrice the productPrice to set
	 */
	public void setProductPrice(long productPrice) {
		this.productPrice = productPrice;
	}
	/**
	 * @return the category
	 */
	public Category getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(Category category) {
		this.category = category;
	}
	/**
	 * @return the instock
	 */
	public int getInstock() {
		return instock;
	}
	/**
	 * @param instock the instock to set
	 */
	public void setInstock(int instock) {
		this.instock = instock;
	}
	/**
	 * @return the productDesc
	 */
	public String getProductDesc() {
		return productDesc;
	}
	/**
	 * @param productDesc the productDesc to set
	 */
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	
}
