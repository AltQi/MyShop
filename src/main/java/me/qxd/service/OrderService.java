package me.qxd.service;

import java.util.Date;

public interface OrderService {
	public int addOrder(String userId, Date date, Double orderPrice);

	public void cancelOrder(int orderId);

	public void restoreOrder(int orderId);

}
