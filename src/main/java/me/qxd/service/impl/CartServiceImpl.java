package me.qxd.service.impl;

import me.qxd.dao.CartMapper;
import me.qxd.domain.Cart;
import me.qxd.service.CartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	CartMapper cartMapper;

	@Override
	public int insertCart(Cart cart) {
		return cartMapper.insert(cart);
	}

	@Override
	public int getCartCount(int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteAllCartsByUserId(String userId) {
		// TODO Auto-generated method stub
		cartMapper.deleteByUserid(userId);

	}

	@Override
	public void updateCartById(int id, int count) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mergeCart(int userId, String jsons) {
		// TODO Auto-generated method stub

	}
}
