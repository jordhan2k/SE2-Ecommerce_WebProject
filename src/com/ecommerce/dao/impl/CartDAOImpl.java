package com.ecommerce.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.connection.DatabaseConnection;
import com.ecommerce.dao.CartDAO;
import com.ecommerce.model.Cart;
import com.ecommerce.model.User;
import com.ecommerce.model.Voucher;

import javafx.scene.chart.PieChart.Data;

/**
 * 
 * @author Huu Bang
 *
 */
public class CartDAOImpl implements CartDAO{
	Connection connection = DatabaseConnection.getConnection();
	
	/**
	 * @effects
	 * 	Insert a new cart record into Cart table  
	 * @param cart
	 */
	@Override
	public void insertCart(Cart cart) {
		String sql = "INSERT INTO cart(voucher_id, user_id, order_date, status, payment_mode, total) VALUES (?, ?, ?, ?,?, ?)";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, cart.getVoucher().getVoucherID());
			ps.setInt(2, cart.getUser().getUserID());
			ps.setDate(3, cart.getOrderDate());
			ps.setString(4, cart.getStatus());
			ps.setString(5, cart.getPaymentMode());
			ps.setLong(6, cart.getTotal());
			ps.executeUpdate();
			System.out.println("Inserted");
			ps.close();
			connection.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	/**
	 * Update cart in database 
	 * 
	 * @effects<pre>
	 *	if the update is successful
	 * 		return true
	 * 	else
	 * 		return false
	 * </pre>
	 * 
	 * @param cart
	 */
	@Override
	public boolean updateCart(Cart cart) {
		String sql = "UPDATE cart SET voucher_id = ?, user_id = ?, order_date = ?, status =?, payment_mode =? , total = ? WHERE cart_id = ?";
		boolean isUpdated = false;
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			
			ps.setInt(1, cart.getVoucher().getVoucherID());
			ps.setInt(2, cart.getUser().getUserID());
			ps.setDate(3, cart.getOrderDate());
			ps.setString(4, cart.getStatus());
			ps.setString(5, cart.getPaymentMode());
			ps.setLong(6, cart.getTotal());
			ps.setInt(7, cart.getCartID());
			ps.close();
			connection.close();
			
			isUpdated = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isUpdated;
	}

	/**
	 * Delete a cart in database by using it's id
	 * 
	 * @effects <pre>
	 * if delete successful
	 * 		return true
	 * else
	 * 		return false
	 * 
	 * </pre>
	 * @param id
	 * @return
	 */
	@Override
	public boolean deleteCart(int cartId) {
		//Query statement
		String sql = "DELETE FROM cart WHERE cart_id = ?";
		boolean isDeleted = false;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, cartId);
			ps.executeUpdate();
			ps.close();
			connection.close();
			isDeleted = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return isDeleted;
	}

	/**
	 * Get cart from database by using it's id
	 * 
	 * @effects  <pre>
	 * if id is  valid
	 * 		get record and return
	 * else
	 * 		return null
	 * </pre>
	 * 
	 * @param cartId
	 * @return
	 */
	@Override
	public Cart getCartById(int cartId) {
		String sql = "SELECT c.order_date, c.status, c.payment_mode, c.total, u.user_fullname, u.user_phone, u.user_address, v.voucher_code, v.discount_percent, v.expire_date" + 
				"	FROM cart c INNER JOIN user u" + 
				"    ON c.user_id = u.user_id" + 
				"    INNER JOIN voucher v" + 
				"    ON c.voucher_id = v.voucher_id"
				+ "	WHERE cart_id = ?";
		Cart cart = null;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, cartId);
			
			ResultSet rs = ps.executeQuery();
			
			
			if(rs.next()) {
				//create user object with  required data
				User user = new User();
				user.setFullname(rs.getString("user_fullname"));
				user.setMobile(rs.getString("user_phone"));
				user.setAddress(rs.getString("user_address"));
				
				
				//create voucher object with required data
				Voucher voucher = new Voucher();
				voucher.setVoucherCode(rs.getString("voucher_code"));
				voucher.setDiscountPercentage(rs.getInt("discount_percent"));
				voucher.setExpireDate(rs.getDate("expire_date"));
				
				//c.order_date, c.status, c.payment_mode, c.total,
				//create cart object
				Date orderDate = rs.getDate("order_date");
				String status = rs.getString("status");
				String paymentMode = rs.getString("payment_mode");
				long total = rs.getLong("total");
				cart = new Cart(cartId, user, orderDate, status, paymentMode, voucher, total);
				
				//close
				ps.close();
				connection.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cart;
	}

	/**
	 * Get all carts in database
	 * @return
	 */
	@Override
	public List<Cart> getAllCarts() {
		
		String sql = "SELECT c.cart_id, c.order_date, c.status, c.payment_mode, c.total, u.user_fullname, u.user_phone, u.user_address, v.voucher_code, v.discount_percent, v.expire_date\r\n" + 
				"				FROM cart c INNER JOIN user u" + 
				"				ON c.user_id = u.user_id" + 
				"				INNER JOIN voucher v " + 
				"				ON c.voucher_id = v.voucher_id;";
		List<Cart> carts = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				//create user object with  required data
				User user = new User();
				user.setFullname(rs.getString("user_fullname"));
				user.setMobile(rs.getString("user_phone"));
				user.setAddress(rs.getString("user_address"));
				
				
				//create voucher object with required data
				Voucher voucher = new Voucher();
				voucher.setVoucherCode(rs.getString("voucher_code"));
				voucher.setDiscountPercentage(rs.getInt("discount_percent"));
				voucher.setExpireDate(rs.getDate("expire_date"));
				
				//c.order_date, c.status, c.payment_mode, c.total,
				//create cart object
				int id = rs.getInt("cart_id");
				Date orderDate = rs.getDate("order_date");
				String status = rs.getString("status");
				String paymentMode = rs.getString("payment_mode");
				long total = rs.getLong("total");
				Cart cart = new Cart(id, user, orderDate, status, paymentMode, voucher, total);
				carts.add(cart);
			}
			//close
			ps.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return carts;
	}	

	/**
	 * Search all carts by using email
	 * 
	 * @effects return all carts match with this email
	 * @param email
	 * @return
	 */
	@Override
	public List<Cart> searchCartByEmail(String email) {
		List<Cart> carts = new ArrayList<>();
		
		String sql = "SELECT c.cart_id, c.order_date, c.status, c.payment_mode, c.total, u.user_fullname, u.user_phone, u.user_address, v.voucher_code, v.discount_percent, v.expire_date \r\n" + 
				"	FROM cart c\r\n" + 
				"	INNER JOIN user u \r\n" + 
				"    ON c.user_id = u.user_id\r\n" + 
				"    INNER JOIN voucher v\r\n" + 
				"    ON c.voucher_id = v.voucher_id\r\n" + 
				"    WHERE u.user_email LIKE ?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1,"%" + email +"%");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				//create user object with  required data
				User user = new User();
				user.setFullname(rs.getString("user_fullname"));
				user.setMobile(rs.getString("user_phone"));
				user.setAddress(rs.getString("user_address"));
				
				
				//create voucher object with required data
				Voucher voucher = new Voucher();
				voucher.setVoucherCode(rs.getString("voucher_code"));
				voucher.setDiscountPercentage(rs.getInt("discount_percent"));
				voucher.setExpireDate(rs.getDate("expire_date"));
				
				//c.order_date, c.status, c.payment_mode, c.total,
				//create cart object
				int id = rs.getInt("cart_id");
				Date orderDate = rs.getDate("order_date");
				String status = rs.getString("status");
				String paymentMode = rs.getString("payment_mode");
				long total = rs.getLong("total");
				Cart cart = new Cart(id, user, orderDate, status, paymentMode, voucher, total);
				carts.add(cart);
			}
			
			ps.close();
			connection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return carts;
	}

	/**
	 * Search all carts by using phone
	 * 
	 * @effects <pre>
	 * 	return all cart match with this phone
	 * </pre>
	 * @param phone
	 * @return
	 */
	@Override
	public List<Cart> searchCartByPhone(String phone) {
List<Cart> carts = new ArrayList<>();
		
		String sql = "SELECT c.cart_id, c.order_date, c.status, c.payment_mode, c.total, u.user_fullname, u.user_phone, u.user_address, v.voucher_code, v.discount_percent, v.expire_date \r\n" + 
				"	FROM cart c\r\n" + 
				"	INNER JOIN user u \r\n" + 
				"    ON c.user_id = u.user_id\r\n" + 
				"    INNER JOIN voucher v\r\n" + 
				"    ON c.voucher_id = v.voucher_id\r\n" + 
				"    WHERE u.user_phone LIKE ?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1,"%" + phone +"%");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				//create user object with  required data
				User user = new User();
				user.setFullname(rs.getString("user_fullname"));
				user.setMobile(rs.getString("user_phone"));
				user.setAddress(rs.getString("user_address"));
				
				
				//create voucher object with required data
				Voucher voucher = new Voucher();
				voucher.setVoucherCode(rs.getString("voucher_code"));
				voucher.setDiscountPercentage(rs.getInt("discount_percent"));
				voucher.setExpireDate(rs.getDate("expire_date"));
				
				//c.order_date, c.status, c.payment_mode, c.total,
				//create cart object
				int id = rs.getInt("cart_id");
				Date orderDate = rs.getDate("order_date");
				String status = rs.getString("status");
				String paymentMode = rs.getString("payment_mode");
				long total = rs.getLong("total");
				Cart cart = new Cart(id, user, orderDate, status, paymentMode, voucher, total);
				carts.add(cart);
			}
			
			ps.close();
			connection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return carts;
	}

}
