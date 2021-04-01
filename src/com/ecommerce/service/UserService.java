package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.User;

/**
 * @overview
 * 	
 * @author HuuBang
 *
 */
public interface UserService {
	
	/**
	 * Insert new user
	 * @param user
	 */
	void insertUser(User user);
	
	/**
	 * Update user information
	 * @param user 
	 * @return
	 */
	boolean updateUser(User user);
	
	/**
	 * Delete a user
	 * @param user
	 * @return
	 */
	boolean deleteUser(int userId);
	
	
	/**
	 * Search user using id 
	 * @param userId
	 * @return
	 */
	User getUserById(int userId);
	
	
	/**
	 * Search user using name
	 * @param userName
	 * @return
	 */
	User getUserByUsername(String username);
	
	/**
	 * Search user using keyword
	 * @param keyword
	 * @return
	 */
	List<User> searchUserByKeyword(String keyword);
	
	/**
	 * Check exist email in
	 * @param email
	 * @return
	 */
	boolean checkExistEmail(String email);
	
	
	/**
	 * Check exist user's name
	 * @param userName
	 * @return
	 */
	boolean checkExistUsername(String username);
	
	
	/**
	 * Login to website
	 * @param username
	 * @param password
	 * @return
	 */
	User login(String username, String password);
	
	/**
	 * Sign up a new account
	 * @param email
	 * @param username
	 * @param password
	 * @param phone
	 * @return
	 */
	boolean register(String email, String username, String password, String phone);

	/**
	 *get all user 
	 * @return
	 */
	List<User> getAllUsers();
	
	
}
