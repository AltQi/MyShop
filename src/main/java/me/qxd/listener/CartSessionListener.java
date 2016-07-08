package me.qxd.listener;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import me.qxd.domain.Cart;
import me.qxd.domain.Product;
import me.qxd.domain.SessionInfo;
import me.qxd.service.CartService;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class CartSessionListener implements HttpSessionAttributeListener,
		ServletContextListener, HttpSessionListener {
	private static ApplicationContext ctx = null;

	public void sessionCreated(HttpSessionEvent se) {

		HttpSession sess = se.getSession();
		System.out.println(sess.getId() + "Session创建了");
		/* 初始化session的cartList属性 */
		List<Product> products = new ArrayList<Product>();
		sess.setAttribute("cartList", products);
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("Session销毁了");
		HttpSession sess = se.getSession();
		List<Product> pro = (List<Product>) sess.getAttribute("cartList");
		System.out.println(pro.size());
		CartService cartService = (CartService) ctx.getBean("cartService");
		SessionInfo sessionInfo = (SessionInfo) sess
				.getAttribute("sessionInfo");
		if (sessionInfo != null) {
			String userId = sessionInfo.getuId();
			cartService.deleteAllCartsByUserId(userId);
			System.out.println(sessionInfo.getuId());
			if (pro != null) {
				Cart cart = new Cart();
				cart.setUserid(sessionInfo.getuId());
				cart.setCreatetime(new Date());
				for (int i = 0; i < pro.size(); i++) {
					cart.setProductid(pro.get(i).getId());
					cart.setProductcount(pro.get(i).getQuantity());
					cartService.insertCart(cart);
				}

			}
		}
	}

	public void contextInitialized(ServletContextEvent evt) {
		ctx = WebApplicationContextUtils.getWebApplicationContext(evt
				.getServletContext());
	}

	public void contextDestroyed(ServletContextEvent sce) {
	}

	public void attributeAdded(HttpSessionBindingEvent event) {
		System.out.println("Session属性增加了");
		String name = event.getName();

	}

	public void attributeRemoved(HttpSessionBindingEvent event) {
		System.out.println("Session属性移除了");
	}

	public void attributeReplaced(HttpSessionBindingEvent event) {
		System.out.println("Session属性修改了");
	}
}
