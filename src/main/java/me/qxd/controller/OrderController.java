package me.qxd.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import me.qxd.domain.Json;
import me.qxd.domain.Product;
import me.qxd.domain.SessionInfo;
import me.qxd.service.CartService;
import me.qxd.service.OrderDetailService;
import me.qxd.service.OrderService;
import me.qxd.service.ProductService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Resource
	public OrderService orderService;
	@Resource
	public CartService cartService;
	@Resource
	public OrderDetailService orderDetailService;
	@Resource
	public ProductService productService;

	@RequestMapping("/order_guess_product")
	@ResponseBody
	public Json getAllProductByCategoryId(HttpServletRequest request) {
		Json j = new Json();
		HttpSession session = request.getSession();
		SessionInfo sessionInfo = (SessionInfo) session
				.getAttribute("sessionInfo");
		String userId = sessionInfo.getuId();
		List<Product> products = productService
				.getUserGuessProductOrder(userId);
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

	@RequestMapping("/submit")
	@ResponseBody
	public Json reg(HttpServletRequest request) {
		Json j = new Json();
		HttpSession session = request.getSession();
		SessionInfo sessionInfo = (SessionInfo) session
				.getAttribute("sessionInfo");
		List<Product> products = (List<Product>) session
				.getAttribute("cartList");
		String userId = sessionInfo.getuId();
		try {
			double cost = 0;
			for (int i = 0; i < products.size(); i++) {
				cost = cost + products.get(i).getCurrentprice()
						* products.get(i).getQuantity();
			}
			int primaryKey = orderService.addOrder(userId, new Date(), cost);
			for (int i = 0; i < products.size(); i++) {
				orderDetailService.addOrderDetail(products.get(i).getId(),
						products.get(i).getQuantity(), primaryKey);
			}
			cartService.deleteAllCartsByUserId(userId);
			List<Product> products1 = new ArrayList<Product>();
			session.setAttribute("cartList", products1);
			j.setSuccess(true);

		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
		}

		/* cartService.deleteCartByIds(Arrays.asList(cartIds)); */
		return j;
	}
}
