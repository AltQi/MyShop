package me.qxd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import me.qxd.domain.Json;
import me.qxd.domain.Product;
import me.qxd.domain.SessionInfo;
import me.qxd.service.CartService;
import me.qxd.service.ProductService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cart")
public class CartController {

	/*
	 * @Resource public CategoryService cartService;
	 */
	@Resource
	CartService cartService;
	@Resource
	ProductService productService;

	@RequestMapping("/cart_guess_product")
	@ResponseBody
	public Json getAllProductByCategoryId(HttpServletRequest request) {
		Json j = new Json();
		HttpSession session = request.getSession();
		SessionInfo sessionInfo = (SessionInfo) session
				.getAttribute("sessionInfo");
		String userId = sessionInfo.getuId();
		List<Product> products = productService.getUserGuessProductCart(userId);
		if (products.size() != 0) {
			List<Product> guess_products = new ArrayList<Product>();
			for (int i = 0; i < products.size(); i++) {
				List<Product> temp_products = productService
						.getUserGuessProductCartThen(products.get(i));
				guess_products.addAll(temp_products);
			}
			j.setObj(guess_products);
			j.setSuccess(true);
		} else {
			j.setSuccess(false);
		}
		return j;
	}

	@RequestMapping("/sessionAdd")
	@ResponseBody
	public Json login(Product product, HttpServletRequest request) {

		Json j = new Json();
		HttpSession session = request.getSession();
		List<Product> products = (List<Product>) session
				.getAttribute("cartList");

		int i;
		for (i = 0; i < products.size(); i++) {
			if (products.get(i).getId() == product.getId()) {
				products.get(i).setQuantity(
						products.get(i).getQuantity() + product.getQuantity());
				break;
			}
		}
		if (i == products.size()) {
			products.add(product);
		}

		session.setAttribute("cartList", products);
		j.setObj(products);
		j.setSuccess(true);
		return j;
	}

	@RequestMapping("/sessionRemove")
	@ResponseBody
	public Json remove(int id, HttpServletRequest request) {

		Json j = new Json();
		HttpSession session = request.getSession();
		List<Product> products = (List<Product>) session
				.getAttribute("cartList");

		int i;
		for (i = 0; i < products.size(); i++) {
			if (products.get(i).getId() == id) {
				products.remove(i);
				break;
			}
		}
		session.setAttribute("cartList", products);
		j.setSuccess(true);
		return j;
	}

	@RequestMapping("/sessionCheck")
	@ResponseBody
	public Json sessionCheck(HttpServletRequest request) {

		Json j = new Json();
		HttpSession session = request.getSession();
		SessionInfo sessionInfo = (SessionInfo) session
				.getAttribute("sessionInfo");
		if (session.getAttribute("sessionInfo") != null) {
			j.setObj(sessionInfo.getuName());
			j.setSuccess(true);
			return j;
		} else {
			j.setSuccess(false);
			return j;
		}

	}

}
