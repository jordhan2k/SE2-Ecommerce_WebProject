package com.ecommerce.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.connection.DatabaseConnection;
import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

/**
 * @overview UserDAO is an abstract interface which facilitates communication to
 *           User table in database.
 * @author DungHT
 */
public class UserDAOImpl implements UserDAO {
	Connection connection = DatabaseConnection.getConnection();

	/**
	 * Insert a new User to database
	 * 
	 * @param user - a customer or admin to be inserted to databse
	 */
	@Override
	public void insertUser(User user) {
		int roleID = 0;
		String gender = null;
		String sql = "INSERT INTO user(user_name, user_password, user_fullname, user_phone, user_email, user_address, gender, user_dob, role_id) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFullname());
			ps.setString(4, user.getMobile());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getAddress());
			ps.setString(7, user.getGender());

			// TODO: wait for User to have dob modified
			ps.setDate(8, user.getDob());
			try {
				if(user.getRoleID() == 1) {
					roleID = 1;
				}else {
					roleID = 0;
				}
			}catch (Exception e) {
				roleID = 0;
			}
			ps.setInt(9, roleID);
			ps.executeUpdate();


		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

	/**
	 * Update an existing User in database
	 * 
	 * @param user - a user to be updated in database
	 * @return true if the user is updated, or false if not
	 */
	@Override
	public boolean updateUser(User user) {
		int roleID = 0;
		boolean isUpdated = false;
		String sql = "UPDATE user SET user_name = ? , user_password = ?, user_fullname=?, user_phone=?, "
				+ "user_email=?, user_address=?, gender=?, user_dob=?, role_id=? WHERE user_id=?";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFullname());
			ps.setString(4, user.getMobile());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getAddress());
			ps.setString(7, user.getGender());
			// TODO: wait for User to have dob modified
			ps.setDate(8, user.getDob());
			try {
				if(user.getRoleID() == 1) {
					roleID = 1;
				}else {
					roleID = 0;
				}
			}catch (Exception e) {
				roleID = 0;
			}
			ps.setInt(9, roleID);
			ps.setInt(10, user.getUserID());

			ps.executeUpdate();

			isUpdated = true;
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return isUpdated;
	}

	/**
	 * Delete an existing User
	 * 
	 * @param userID - the id of the user to be deleted
	 * @return true if the user is deleted, or false if not
	 */
	@Override
	public boolean deleteUser(int userID) {
		boolean isDeleted = false;
		String sql = "DELETE FROM user WHERE user_id=?";

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, userID);
			ps.executeUpdate();
			isDeleted = true;

		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e.getMessage());
		}
		return isDeleted;
	}

	/**
	 * Get a User from database by its id
	 * 
	 * @param userID - the id of the desired User
	 * @return Either the desired User if found or null if not
	 */
	@Override
	public User getUserByID(int userID) {
		String sql = "SELECT * FROM user WHERE user_id = ?";
		User user = null;

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, userID);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				String username = rs.getString("user_name");

				String password = rs.getString("user_password");

				String fullname = rs.getString("user_fullname");

				String mobile = rs.getString("user_phone");

				String email = rs.getString("user_email");

				String address = rs.getString("user_address");

				String gender = rs.getString("gender");

				Date dob = rs.getDate("user_dob");

				int roleID = rs.getInt("role_id");

				user = new User(userID, username, password, fullname, mobile, email, address, gender, dob, roleID);

			}
			
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return user;
	}

	/**
	 * Get a User from database by its username
	 * 
	 * @param username - the username of the desired User
	 * @return Either the desired User if found or null if not
	 */
	@Override
	public User getUserByUsername(String username) {
		String sql = "SELECT * FROM user WHERE user_name = ?";
		User user = null;

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, username);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				int userID = rs.getInt("user_id");

				String password = rs.getString("user_password");

				String fullname = rs.getString("user_fullname");

				String mobile = rs.getString("user_phone");

				String email = rs.getString("user_email");

				String address = rs.getString("user_address");

				String gender = rs.getString("gender");

				Date dob = rs.getDate("user_dob");

				int roleID = rs.getInt("role_id");

				user = new User(userID, username, password, fullname, mobile, email, address, gender, dob, roleID);

				
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return user;
	}

	/**
	 * Get all Users that exist in database
	 * 
	 * @return Either the list of Users or null if there is no User
	 */
	@Override
	public List<User> getAllUsers() {
		String sql = "SELECT * FROM user";
		List<User> list = new ArrayList<User>();

		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int userID = rs.getInt("user_id");

				String username = rs.getString("user_name");

				String password = rs.getString("user_password");

				String fullname = rs.getString("user_fullname");

				String mobile = rs.getString("user_phone");

				String email = rs.getString("user_email");

				String address = rs.getString("user_address");

				String gender = rs.getString("gender");

				Date dob = rs.getDate("user_dob");

				int roleID = rs.getInt("role_id");

				User user = new User(userID, username, password, fullname, mobile, email, address, gender, dob, roleID);

				list.add(user);

				
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return list;
	}

	/**
	 * Search for a User by keyword
	 * 
	 * @param keyword - the keyword to be searched for (eg: username, email, phone)
	 * @return Either the list of matching result or null if there is no matches
	 */
	@Override
	public List<User> searchUserByKeyword(String keyword) {
		String sql = "SELECT * FROM user WHERE user_name LIKE ? " + "OR user_email LIKE ? OR phone LIKE ?";
		List<User> list = new ArrayList<User>();

		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "%" + keyword + "%");
			ps.setString(2, "%" + keyword + "%");
			ps.setString(3, "%" + keyword + "%");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int userID = rs.getInt("user_id");

				String username = rs.getString("user_name");

				String password = rs.getString("user_password");

				String fullname = rs.getString("user_fullname");

				String mobile = rs.getString("user_phone");

				String email = rs.getString("user_email");

				String address = rs.getString("user_address");

				String gender = rs.getString("gender");

				Date dob = rs.getDate("user_dob");

				int roleID = rs.getInt("role_id");

				User user = new User(userID, username, password, fullname, mobile, email, address, gender, dob, roleID);

				list.add(user);

			
			}
			
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return list;
	}

	/**
	 * Check if an email address exists in database
	 * 
	 * @param email - the email address to be checked
	 * @return True if it is found, or false if not
	 */
	@Override
	public boolean checkExistEmail(String email) {
		boolean isDuplicated = false;
		String sql = "SELECT * FROM user WHERE user_email = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				isDuplicated = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return isDuplicated;
	}

	/**
	 * Check if a username exists in database
	 * 
	 * @param username - the username string to be checked
	 * @return
	 */
	@Override
	public boolean checkExistUsername(String username) {
		boolean isDuplicated = false;
		String sql = "SELECT * FROM user WHERE user_name = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				isDuplicated = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return isDuplicated;
	}
	
	
	/**
	 * Check if a phone exists in database
	 * @param phone - the phone to be checked
	 * @return
	 */
	@Override
	public boolean checkExistPhone(String phone) {
		boolean isDuplicated = false;
		String sql = "SELECT * FROM user WHERE user_phone = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, phone);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				isDuplicated = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return isDuplicated;
	}
	

}
