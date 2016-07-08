package me.qxd.service;


public interface OrderDetailService {
	public int addOrderDetail(int productId, int productCount, int orderId);

	public void deleteOrderDetail(int orderId);

}
