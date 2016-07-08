package me.qxd.service.impl;

import java.util.List;
import java.util.UUID;

import me.qxd.dao.CityMapper;
import me.qxd.dao.OrderMapper;
import me.qxd.dao.ProvinceMapper;
import me.qxd.dao.UserMapper;
import me.qxd.dao.UserRoleMapper;
import me.qxd.domain.City;
import me.qxd.domain.Datagrid;
import me.qxd.domain.Echarts;
import me.qxd.domain.Province;
import me.qxd.domain.User;
import me.qxd.domain.UserRole;
import me.qxd.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * 使用@Service注解将UserServiceImpl类标注为一个service service的id是userService
 */
@Service("userService")
public class UserServiceImpl implements UserService {

	/**
	 * 使用@Autowired注解标注userMapper变量， 当需要使用UserMapper时，Spring就会自动注入UserMapper
	 */
	@Autowired
	private UserMapper userMapper;// 注入dao
	@Autowired
	private ProvinceMapper provinceMapper;
	@Autowired
	private CityMapper cityMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public int addUser(User user) {

		return userMapper.insert(user);

	}

	@Override
	public User find(User user) {
		return userMapper.find(user);

	}

	@Override
	public User getUserById(String userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	@Override
	public List<User> getAllUser() {
		return userMapper.getAllUser();
	}

	@Override
	public List<Province> getPro() {
		// TODO Auto-generated method stub
		return provinceMapper.getAllPro();
	}

	@Override
	public List<City> getCity(City city) {
		// TODO Auto-generated method stub
		return cityMapper.getAllCity(city);

	}

	@Override
	public int edit(User user) {
		// TODO Auto-generated method stub
		UserRole userrole = new UserRole();
		userrole.setUserId(user.getId());
		userrole.setRoleId(user.getRoleId());
		int i;
		i = userRoleMapper.selecto(userrole);
		if (i <= 0) {
			userrole.setId(UUID.randomUUID().toString().replace("-", ""));
			userRoleMapper.inserta(userrole);
		} else {
			userRoleMapper.updateo(userrole);
		}
		return userMapper.updateByPrimaryKey(user);
	}

	@Override
	public void remove(String ids) {
		// TODO Auto-generated method stub
		User user = new User();
		for (String id : ids.split(",")) {
			user.setId(id);
			userMapper.deleteById(user);
		}
	}

	@Override
	public Datagrid datagrid(User user) {
		// TODO Auto-generated method stub
		int start = (user.getPage() - 1) * user.getRows();
		user.setPage(start);

		Datagrid dg = new Datagrid();

		dg.setTotal(userMapper.getTotalNumber(user));

		dg.setRows(userMapper.getPageUser(user));
		return dg;
	}

	@Override
	public User get(User user) {
		// TODO Auto-generated method stub
		return userMapper.get(user);
	}

	@Override
	public List<Echarts> getPeopleCountPro() {
		// TODOAuto-generated method stub
		return userMapper.getPeopleCountPro();
	}

	@Override
	public List<Echarts> getPeopleAgeCount() {
		// TODOAuto-generated method stub
		return userMapper.getPeopleAgeCount();
	}

	@Override
	public List<Echarts> getOneOrderPrice(String userId) {
		// TODO Auto-generated method stub
		return orderMapper.getOneOrderPrice(userId);
	}

	@Override
	public List<Echarts> getOneBuyType(String userId) {
		// TODO Auto-generated method stub
		return orderMapper.getOneBuyType(userId);
	}

}