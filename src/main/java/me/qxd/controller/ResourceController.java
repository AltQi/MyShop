package me.qxd.controller;
import java.util.List;

import me.qxd.domain.Json;
import me.qxd.domain.Menu;
import me.qxd.domain.Resource;
import me.qxd.service.ResourceServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/resourceController")
public class ResourceController {

	private ResourceServiceI resourceService;

	public ResourceServiceI getResourceService() {
		return resourceService;
	}

	@Autowired
	public void setResourceService(ResourceServiceI resourceService) {
		this.resourceService = resourceService;
	}

	@RequestMapping("/allTreeNode")
	@ResponseBody
	public List<Resource> allTreeNode() {
		return resourceService.allTreeNode();
	}
	@RequestMapping("/add")
	@ResponseBody
	public Json add(Resource resource) {
		
		Json j = new Json();
		try{
			resourceService.add(resource);
		j.setSuccess(true);
		j.setObj(resource);
		j.setMsg("添加成功!");
		}catch (Exception e) {
			j.setMsg("增加失败！资源已存在！");
			}
		return j;
		
	}
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Resource resource) {
		
		Json j = new Json();
		try{
			resourceService.edit(resource);
		j.setSuccess(true);
		j.setObj(resource);
		j.setMsg("编辑成功!");
		}catch (Exception e) {
			j.setMsg("编辑失败！");
			}
		return j;
		
	}
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(String id) {
		Json j = new Json();
		try{
		resourceService.remove(id);
		j.setSuccess(true);
		j.setObj(id);
		j.setMsg("删除成功!");
		}
		catch (Exception e) {
			j.setMsg("删除失败");
			}
		return j;
	}

}
