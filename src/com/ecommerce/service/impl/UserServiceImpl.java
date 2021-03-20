package com.ecommerce.service.impl;

import java.util.List;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.dao.impl.UserDAOImpl;
import com.ecommerce.model.User;
import com.ecommerce.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDAO userDAO = new UserDAOImpl();

	
	/**
	 * Insert new user
	 * @param user
	 */
	@Override
	public void insertUser(User user) {
		userDAO.insertUser(user);
		
	}

	/**
	 * Update user information
	 * @param user 
	 * @return
	 */
	@Override
	public boolean updateUser(User user) {
		return userDAO.updateUser(user);
	}

	/**
	 * Delete a user
	 * @param user
	 * @return
	 */
	@Override
	public boolean deleteUser(int userID) {

		return userDAO.deleteUser(userID);
	}

	/**
	 *get all user 
	 * @return
	 */
	@Override
	public List<User> getAllUser(int userID) {
		
		return userDAO.getAllUsers();
	}

	/**
	 * Search user using id 
	 * @param userId
	 * @return
	 */
	@Override
	public User getUserById(int userId) {
		
		return userDAO.getUserByID(userId);
	}

	/**
	 * Search user using name
	 * @param userName
	 * @return
	 */
	@Override
	public User getUserByUsername(String username) {
		
		return userDAO.getUserByUsername(username);
	}

	/**
	 * Search user using keyword
	 * @param keyword
	 * @return
	 */
	@Override
	public List<User> searchUserByKeyword(String keyword) {
		
		return userDAO.searchUserByKeyword(keyword);
	}

	/**
	 * Check exist email in
	 * @param email
	 * @return
	 */
	@Override
	public boolean checkExistEmail(String email) {
		
		return userDAO.checkExistEmail(email);
	}

	/**
	 * Check exist user's name
	 * @param userName
	 * @return
	 */
	@Override
	public boolean checkExistUsername(String username) {
		return userDAO.checkExistUsername(username);
	}

	/**
	 * Login to website
	 * @param username
	 * @param password
	 * @return
	 */
	@Override
	public User login(String username, String password) {
		User user = getUserByUsername(username);
		
		if(user!= null && password.equals(user.getPassword())) {
			return user;
		}
		
		return null;
	}

	/**
	 * Sign up a new account
	 * @param email
	 * @param username
	 * @param password
	 * @param phone
	 * @return
	 */
	@Override
	public boolean register(String email, String username, String password, String phone) {
		if(userDAO.checkExistEmail(email) || userDAO.checkExistUsername(username) || userDAO.checkExistPhone(phone)) {
			return false;
		}
		return true;
	}

}