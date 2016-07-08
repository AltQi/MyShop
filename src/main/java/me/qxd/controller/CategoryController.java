package me.qxd.controller;

import java.util.List;

import javax.annotation.Resource;

import me.qxd.domain.Category;
import me.qxd.service.CategoryService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "category")
public class CategoryController {

	@Resource
	CategoryService categoryService;

	@RequestMapping(value = "categoryList")
	@ResponseBody
	public List<Category> allTreeNode() {
		return categoryService.getAllCategory();
	}

}
