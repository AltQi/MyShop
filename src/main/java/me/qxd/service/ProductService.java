package me.qxd.service;

import java.util.List;

import me.qxd.domain.Product;

public interface ProductService {

	public List<Product> getAllProductByCategoryId(int id);

	public List<Product> getUserProductCart(String userId);

	public List<Product> getUserGuessProductCart(String userId);

	public List<Product> getUserGuessProductCartThen(Product product);

	public List<Product> getUserGuessProductOrder(String userId);

	public List<Product> getSellMostProduct();
}
