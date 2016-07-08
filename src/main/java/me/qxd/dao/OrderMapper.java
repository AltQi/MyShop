package me.qxd.dao;

import java.util.List;

import me.qxd.domain.Echarts;
import me.qxd.domain.Order;

public interface OrderMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Order record);

	int insertSelective(Order record);

	Order selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Order record);

	int updateByPrimaryKey(Order record);

	List<Echarts> getOneOrderPrice(String userId);

	List<Echarts> getOneBuyType(String userId);
}