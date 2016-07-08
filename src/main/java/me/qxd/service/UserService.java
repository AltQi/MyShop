package me.qxd.service;

import java.util.List;

import me.qxd.domain.City;
import me.qxd.domain.Datagrid;
import me.qxd.domain.Echarts;
import me.qxd.domain.Province;
import me.qxd.domain.User;

public interface UserService {

	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return
	 */
	int addUser(User user);

	/**
	 * 根据用户id获取用户
	 * 
	 * @param userId
	 * @return
	 */
	User getUserById(String userId);

	/**
	 * 根据用户名和密码获取用户
	 */
	User find(User user);

	/**
	 * 查看是否为管理员用户
	 */
	User get(User user);

	/**
	 * 获取所有用户信息
	 * 
	 * @return List<User>
	 */
	List<User> getAllUser();

	List<Province> getPro();

	Datagrid datagrid(User user);

	List<City> getCity(City city);

	List<Echarts> getPeopleCountPro();

	List<Echarts> getPeopleAgeCount();

	List<Echarts> getOneOrderPrice(String userId);

	List<Echarts> getOneBuyType(String userId);

	int edit(User user);

	void remove(String ids);

}