package com.ecommerce.model;

/**
 * @overview 
 * 		<pre>
 * 	User represent people who use the website
 * 	User comprises of Admin and Customer, whose roles are defined by roleID attribute
 * 		</pre>
 * 
 * @attributes
 * <pre>
 * userID 	Integer		int
 * username	String
 * fullname	String
 * password	String
 * mobile	String
 * email	String
 * address	String
 * gender	String
 * dob		String
 * roleID	Integer		int
 * </pre>
 * 
 * @abstract_properties
 * 	<pre>
 * 	mutable(userID) = false /\ optional(userID) = false /\ min(userID) = 100000 /\ length(userID) = 6 /\
 * 	mutable(username) = false /\ optional(username) = false /\ length(username) = 25 /\
 * 	mutable(fullname) = true /\ optional(fullname) = false /\ length(fullname) = 30 /\
 * 	mutable(password) = true /\ optional(password) = false /\ length(password) = 25 /\
 * 	mutable(mobile) = true /\ optional(mobile) = false /\ length(mobile) = 10 /\
 * 	mutable(email) = true /\ optional(email) = false /\ length(email) = 50 /\
 * 	mutable(address) = true /\ optional(address) = false /\ length(address) = 200 /\
 * 	mutable(gender) = true /\ optional(gender) = false /\ length(gender) = 10 /\
 * 	mutable(dob) = true /\ optional(dob) = false /\ length(dob) = 20 /\
 * 	mutable(roleID) = false /\ optional(roleID) = false
 * 	
 * 	</pre>
 */
public class User{
	private int userID;
	private String username;
	private String password;
	private String fullname;
	private String mobile;
	private String email;
	private String address;
	private String gender;
	private String dob;
	private int roleID;
	
	
	//Constructor	
	public User() {
		super();
	}
	
	/**
	 * @effects
	 *  	<pre>
	 *  initialize this as <userID, username, password, fullname, mobile, email, address,
	 *  gender, dob, roleID>
	 *  	</pre>
	 */
	public User(int userID, String username, String password, String fullname, String mobile, String email,
			String address, String gender, String dob, int roleID) {
		super();
		this.userID = userID;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.gender = gender;
		this.dob = dob;
		this.roleID = roleID;
	}
	


	//Getters & Setters
	/**
	 * @effects return <tt>userID</tt>
	 * 
	 */
	public int getUserID() {
		return userID;
	}
	
	/**
	 * @effects return <tt>username</tt>
	 * 
	 */
	public String getUserName() {
		return username;
	}
	
	/**
	 * @effects return <tt>password</tt>
	 * 
	 */
	public String getPassword() {
		return password;
	}
	
	/**
	 * @effects set this.password to password
	 * 
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * @effects return <tt>fullname</tt>
	 * 
	 */
	public String getFullName() {
		return fullname;
	}
	
	/**
	 * @effects set this.fullname to fullname
	 * 
	 */
	public void setFullName(String fullname) {
		this.fullname = fullname;
	}
	
	/**
	 * @effects return <tt>mobile</tt>
	 * 
	 */
	public String getMobile() {
		return mobile;
	}
	
	/**
	 * @effects set this.mobile to mobile
	 * 
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	/**
	 * @effects return <tt>email</tt>
	 * 
	 */
	public String getEmail() {
		return email;
	}
	
	/**
	 * @effects set this.email to email
	 * 
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	
	/**
	 * @effects return <tt>address</tt>
	 * 
	 */
	public String getAddress() {
		return address;
	}
	
	/**
	 * @effects set this.address to address
	 * 
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	
	/**
	 * @effects return <tt>gender</tt>
	 * 
	 */
	public String getGender() {
		return gender;
	}
	
	/**
	 * @effects set this.gender to gender
	 * 
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	/**
	 * @effects return <tt>dob</tt>
	 * 
	 */
	public String getDob() {
		return dob;
	}
	
	/**
	 * @effects set this.dob to dob
	 * 
	 */
	public void setDob(String dob) {
		this.dob = dob;
			
	}
	
	/**
	 * @effects return <tt>roleID</tt>
	 * 
	 */
	public int getRoleID() {
		return roleID;
	}

	
}
