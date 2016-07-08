package me.qxd.dao;

import java.util.List;

import me.qxd.domain.Category;

public interface CategoryMapper {
	List<Category> selectAllCategory();

	int deleteByPrimaryKey(Integer id);

	int insert(Category record);

	int insertSelective(Category record);

	Category selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Category record);

	int updateByPrimaryKey(Category record);
}