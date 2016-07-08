package me.qxd.controller;

import java.util.List;

import me.qxd.domain.Json;
import me.qxd.domain.Menu;
import me.qxd.service.MenuServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/menuController")
public class MenuController {

	private MenuServiceI menuService;

	public MenuServiceI getMenuService() {
		return menuService;
	}

	@Autowired
	public void setMenuService(MenuServiceI menuService) {
		this.menuService = menuService;
	}

	@RequestMapping("/allTreeNode")
	@ResponseBody
	public List<Menu> allTreeNode() {
		return menuService.allTreeNode();
	}

	@RequestMapping("/treegrid")
	@ResponseBody
	public List<Menu> treegrid() {
		return menuService.treegrid();
	}

	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(String id) {
		Json j = new Json();
		try{
		menuService.remove(id);
		j.setSuccess(true);
		j.setObj(id);
		j.setMsg("删除成功!");
		}
		catch (Exception e) {
			j.setMsg("删除失败");
			}
		return j;
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(Menu menu) {
		
		Json j = new Json();
		try{
		menuService.add(menu);
		j.setSuccess(true);
		j.setObj(menu);
		j.setMsg("添加成功!");
		}catch (Exception e) {
			j.setMsg("增加失败！用户名已存在！");
			}
		return j;
		
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Menu menu) {
		Json j = new Json();
		try{
			menuService.edit(menu);
		j.setSuccess(true);
	
		j.setMsg("编辑成功!");
		}catch (Exception e) {
			j.setMsg("增加失败！用户名已存在！");
			}
		return j;
	}

}
