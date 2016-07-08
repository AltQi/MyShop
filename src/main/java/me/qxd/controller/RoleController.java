package me.qxd.controller;

import me.qxd.domain.Datagrid;
import me.qxd.domain.Json;
import me.qxd.domain.Role;
import me.qxd.service.RoleServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/roleController")
public class RoleController {

	private RoleServiceI roleService;

	public RoleServiceI getRoleService() {
		return roleService;
	}

	@Autowired
	public void setRoleService(RoleServiceI roleService) {
		this.roleService = roleService;
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(Role role) {
		Json j = new Json();
		try {
			Role r=roleService.addone(role);
			j.setSuccess(true);
			j.setMsg("添加成功！");
			j.setObj(r);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(Role role) {
		roleService.remove(role);
		Json j = new Json();
		j.setSuccess(true);
		j.setMsg("删除成功！");
		return j;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Role role) {
		Json j = new Json();
		try {
			roleService.edit(role);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
			j.setObj(role);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	@RequestMapping("/datagrid")
	@ResponseBody
	public Datagrid datagrid(Role role) {
		
		
		return roleService.datagrid(role);
	}
	@RequestMapping("/combogrid")
	@ResponseBody
	public Datagrid combogrid(Role role) {
		
		
		return roleService.datagrid(role);
	}

}
