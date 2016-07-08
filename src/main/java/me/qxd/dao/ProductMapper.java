package me.qxd.dao;

import java.util.List;

import me.qxd.domain.Product;

public interface ProductMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Product record);

	int insertSelective(Product record);

	Product selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Product record);

	int updateByPrimaryKeyWithBLOBs(Product record);

	int updateByPrimaryKey(Product record);

	List<Product> getAllProductByCategoryId(int categoryId);

	List<Product> selectUserProductCart(String userId);

	List<Product> selectUserGuessProductCart(String userId);

	List<Product> getUserGuessProductCartThen(Product product);

	List<Product> selectUserGuessProductOrder(String userId);

	List<Product> getSellMostProduct();
}