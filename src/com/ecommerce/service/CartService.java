package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Cart;


/**
 * @overview 
 * @author ThanhTra
 *
 */
public interface CartService {
	
	/**
	 * Insert new cart
	 * @param cart
	 */
	void insertCart(Cart cart);
	
	/**
	 * Update cart information
	 * @param cart
	 * @return
	 */
	boolean updateCart(Cart cart);
	
	/**
	 * Update cart information
	 * @param cart
	 * @return
	 */
	boolean updateCartStatus(int cartID, String cartStatus);
	
	/**
	 * Delete a cart
	 * @param cart
	 * @return
	 */
	
	boolean deleteCart(int cartId);
	
	/**
	 * Retreive a cart by its id
	 * 
	 * @param cartID - the id of the desired cart
	 * @return
	 */
	
	Cart getCartById(int cartId);
	
	/**
	 * Retrieve all carts
	 * 
	 * @return Either the list of all carts or null if there is none
	 */
	
	List<Cart> getAllCarts();
	
	/**
	 * Search cart using email
	 * @param email
	 * @return
	 */
	
	List<Cart> searchCartByEmail(String email);
	
	/**
	 * Search cart by phone
	 * @param phone
	 * @return
	 */
	
	List<Cart> searchCartByPhone(String phone);
}
