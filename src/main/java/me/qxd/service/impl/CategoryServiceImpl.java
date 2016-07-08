package me.qxd.service.impl;

import java.util.List;

import me.qxd.dao.CategoryMapper;
import me.qxd.domain.Category;
import me.qxd.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryMapper categoryMapper;

	@Override
	public List<Category> getAllCategory() {
		// TODO Auto-generated method stub
		return categoryMapper.selectAllCategory();
	}

}
