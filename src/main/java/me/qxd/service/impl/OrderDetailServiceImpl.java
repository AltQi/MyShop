package me.qxd.service.impl;

import me.qxd.dao.OrderdetailMapper;
import me.qxd.domain.Orderdetail;
import me.qxd.service.OrderDetailService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	OrderdetailMapper orderDetailMapper;

	@Override
	public void deleteOrderDetail(int orderId) {
		// TODO Auto-generated method stub

	}

	@Override
	public int addOrderDetail(int productId, int productCount, int orderId) {
		// TODO Auto-generated method stub
		Orderdetail orderDetail = new Orderdetail();
		orderDetail.setOrderid(orderId);
		orderDetail.setProductcount(productCount);
		orderDetail.setProductid(productId);
		return orderDetailMapper.insert(orderDetail);
	}

}
