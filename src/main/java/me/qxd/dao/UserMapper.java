package me.qxd.dao;

import java.util.List;

import me.qxd.domain.Echarts;
import me.qxd.domain.User;

public interface UserMapper {
	int deleteByPrimaryKey(String uName);

	int deleteById(User record);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(String uName);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	/**
	 * 检查用户是否存在
	 */
	User find(User record);

	User get(User record);

	Long getTotalNumber(User user);

	List<User> getPageUser(User user);

	/**
	 * 获取所有用户信息
	 * 
	 * @return List<User>
	 */
	List<User> getAllUser();

	User findname(User user);

	List<Echarts> getPeopleCountPro();

	List<Echarts> getPeopleAgeCount();

}