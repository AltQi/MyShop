package me.qxd.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import me.qxd.domain.Product;
import me.qxd.domain.SessionInfo;
import me.qxd.service.ProductService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Resource
	ProductService productService;

	@RequestMapping("/productDetails")
	@ResponseBody
	public List<Product> getAllProductByCategoryId(int id) {

		List<Product> products = productService.getAllProductByCategoryId(id);
		return products;
	}

	@RequestMapping("/productSellMostDetails")
	@ResponseBody
	public List<Product> getSellMostProduct() {

		List<Product> products = productService.getSellMostProduct();
		return products;
	}

	@RequestMapping("/productCart")
	@ResponseBody
	public List<Product> productCart(HttpServletRequest request) {
		if ((SessionInfo) request.getSession().getAttribute("sessionInfo") != null) {
			String userId = ((SessionInfo) request.getSession().getAttribute(
					"sessionInfo")).getuId();
			List<Product> products = productService.getUserProductCart(userId);
			request.getSession().setAttribute("cartList", products);
			return products;
		} else
			return null;
	}
}
