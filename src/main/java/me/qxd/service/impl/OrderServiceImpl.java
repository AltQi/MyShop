package me.qxd.service.impl;

import java.util.Date;

import me.qxd.dao.OrderMapper;
import me.qxd.domain.Order;
import me.qxd.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper orderMapper;

	@Override
	public int addOrder(String userId, Date date, Double orderPrice) {
		// TODO Auto-generated method stub
		Order order = new Order();
		order.setUserid(userId);
		order.setCreatetime(date);
		order.setOrderPrice(orderPrice);
		orderMapper.insert(order);
		return order.getId();
	}

	@Override
	public void cancelOrder(int orderId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void restoreOrder(int orderId) {
		// TODO Auto-generated method stub

	}

}
