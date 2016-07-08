package me.qxd.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import me.qxd.domain.City;
import me.qxd.domain.Datagrid;
import me.qxd.domain.Echarts;
import me.qxd.domain.Json;
import me.qxd.domain.Province;
import me.qxd.domain.SessionInfo;
import me.qxd.domain.User;
import me.qxd.service.UserService;
import me.qxd.utils.DateEditor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {

	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new DateEditor());

	}

	@RequestMapping("/reg")
	@ResponseBody
	public Json reg(User user) {
		Json j = new Json();
		user.setCreatedate(new Date());
		user.setId(UUID.randomUUID().toString().replace("-", ""));
		try {
			userService.addUser(user);
			j.setSuccess(true);
			j.setMsg("注册成功！");
		} catch (Exception e) {

			j.setMsg("注册失败！用户名已存在！");

		}
		return j;
	}

	@RequestMapping("/login")
	@ResponseBody
	public Json login(User user, HttpServletRequest request) {

		Json j = new Json();
		User u = userService.find(user);

		if (u != null) {
			j.setSuccess(true);
			j.setMsg("登录成功！");
			HttpSession session = request.getSession();
			System.out.println(session.getId() + "requestSession创建了");
			SessionInfo sessionInfo = new SessionInfo();
			sessionInfo.setuId(u.getId());
			sessionInfo.setuName(u.getUsername());
			sessionInfo.setStatus(true);
			session.setAttribute("sessionInfo", sessionInfo);
			j.setObj(sessionInfo);
		} else {
			j.setMsg("登录失败！");
		}
		return j;
	}

	/* 管理员登录 */
	@RequestMapping("/managerLogin")
	@ResponseBody
	public Json managerLogin(User user) {

		Json j = new Json();
		User u = userService.find(user);

		if (u != null) {
			User role = userService.get(u);
			if (role != null) {
				j.setSuccess(true);
				j.setMsg("登录成功");
			} else {
				j.setSuccess(false);
				j.setMsg("您不是管理员用户，请联系管理员赋予您权限");
			}
		} else {
			j.setSuccess(false);
			j.setMsg("用户名或密码错误");
		}
		return j;
	}

	// 分页
	@RequestMapping("/pagesize")
	@ResponseBody
	public Datagrid pagesize(User user) {
		if (user.getSort().equals("uName"))
			user.setSort("u_name");
		if (user.getSort().equals("uPwd"))
			user.setSort("u_pwd");
		if (user.getSort().equals("uId"))
			user.setSort("u_id");

		return userService.datagrid(user);
	}

	@RequestMapping("/getPro")
	@ResponseBody
	public List<Province> getPro() {

		return userService.getPro();

	}

	@RequestMapping("/getPeopleAgeCount")
	@ResponseBody
	public List<Echarts> getPeopleAgeCount() {
		return userService.getPeopleAgeCount();
	}

	@RequestMapping("/getPeopleCountPro")
	@ResponseBody
	public List<Echarts> getPeopleCountPro() {

		return userService.getPeopleCountPro();

	}

	@RequestMapping("/getOneOrderPrice")
	@ResponseBody
	public List<Echarts> getOneOrderPrice(String userId) {

		return userService.getOneOrderPrice(userId);

	}

	@RequestMapping("/getOneBuyType")
	@ResponseBody
	public List<Echarts> getOneBuyType(String userId) {

		return userService.getOneBuyType(userId);

	}

	@RequestMapping("/getCity")
	@ResponseBody
	public List<City> getCity(City city, HttpServletRequest req) {

		city.setCityProId(Integer.parseInt(req.getParameter("cityProid")));
		return userService.getCity(city);

	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(HttpServletRequest req) throws ParseException {
		DateFormat fmt = new SimpleDateFormat("mm/dd/yyyy");
		/*
		 * SimpleDateFormat sdf = new SimpleDateFormat( " mm/dd/yyyy HH:mm:ss "
		 * );
		 */
		User user = new User();
		user.setName(req.getParameter("uName"));
		user.setBirthday(fmt.parse(req.getParameter("uBirth")));

		/* user.setuLastdate(sdf.parse(req.getParameter("uLastdate"))); */
		Json j = new Json();
		user.setCreatedate(new Date());
		user.setId(UUID.randomUUID().toString().replace("-", ""));
		try {
			userService.addUser(user);
			j.setSuccess(true);
			j.setMsg("增加成功！");
		} catch (Exception e) {
			j.setMsg("增加失败！用户名已存在！");

		}
		return j;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(User user) {
		Json j = new Json();
		try {
			userService.edit(user);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
			j.setObj(user);
		} catch (Exception e) {
			j.setMsg("编辑失败！用户名已存在！");
		}
		return j;
	}

	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(User user) {
		userService.remove(user.getIds());
		Json j = new Json();
		j.setSuccess(true);
		j.setMsg("删除成功！");
		return j;
	}
}
