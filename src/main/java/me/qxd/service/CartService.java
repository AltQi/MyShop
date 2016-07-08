package me.qxd.service;

import me.qxd.domain.Cart;

public interface CartService {

	public int insertCart(Cart cart);

	public int getCartCount(int userId);

	public void deleteAllCartsByUserId(String userId);

	public void updateCartById(int id, int count);

	public void mergeCart(int userId, String jsons);

}
