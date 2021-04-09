package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.CartLine;

/**
 * 
 * @author ThanhTra
 *
 */
public interface CartLineService { 
	/**
	 * Insert new cartline
	 * @param cartline
	 */
	void insertCartLine (CartLine cartLine);
	
	/**
	 * Update cartline information
	 * @param cartline
	 * @return
	 */
	
	boolean updateCartLine(CartLine cartLine);
	
	/**
	 * Delete a cartline
	 * @param cartline
	 * @return
	 */
	
	boolean deleteCartLine(int cartLineID);
	
	/**
	 * Retrieve a cartline by its id
	 * 
	 * @param cartLineID - the id of the desired cartline
	 * @return
	 */
	
	CartLine getCartLineByID(int cartLineID);
	
	/**
	 * Retrieve all cartLine belong to the desired cart
	 * 
	 * @param cartID the id of cartID
	 * @return
	 */
	List<CartLine> getCartLineByCartID(int cartID);
	
	/**
	 * Retrieve all cartlines
	 * 
	 * @return Either the list of all cartlines or null if there is none
	 */
	
	List<CartLine> getAllCartLines();
}
