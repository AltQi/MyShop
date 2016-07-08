package me.qxd.service.impl;

import java.util.List;

import me.qxd.dao.ProductMapper;
import me.qxd.domain.Product;
import me.qxd.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;

	@Override
	public List<Product> getAllProductByCategoryId(int id) {
		// TODO Auto-generated method stub
		return productMapper.getAllProductByCategoryId(id);
	}

	@Override
	public List<Product> getUserProductCart(String userId) {
		// TODO Auto-generated method stub
		return productMapper.selectUserProductCart(userId);
	}

	@Override
	public List<Product> getUserGuessProductCart(String userId) {
		// TODO Auto-generated method stub
		return productMapper.selectUserGuessProductCart(userId);
	}

	@Override
	public List<Product> getUserGuessProductCartThen(Product product) {
		// TODO Auto-generated method stub
		return productMapper.getUserGuessProductCartThen(product);
	}

	@Override
	public List<Product> getUserGuessProductOrder(String userId) {
		// TODO Auto-generated method stub
		return productMapper.selectUserGuessProductOrder(userId);
	}

	@Override
	public List<Product> getSellMostProduct() {
		// TODO Auto-generated method stub
		return productMapper.getSellMostProduct();
	}
}
