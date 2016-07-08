package me.qxd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.qxd.dao.MenuMapper;
import me.qxd.dao.ResourceMapper;
import me.qxd.domain.Resource;
import me.qxd.service.ResourceServiceI;
@Service("resourceService")
public class ResourceServiceImpl implements ResourceServiceI {
	 @Autowired
	   private ResourceMapper resourceMapper;//注入dao


		
	@Override
	public List<Resource> allTreeNode() {
		// TODO Auto-generated method stub
		return resourceMapper.allTreeNode();
	}



	@Override
	public void add(Resource resource) {
		// TODO Auto-generated method stub
		resourceMapper.add(resource);
	}



	@Override
	public void edit(Resource resource) {
		// TODO Auto-generated method stub
		resourceMapper.edit(resource);
	}



	@Override
	public void remove(String id) {
		// TODO Auto-generated method stub
		resourceMapper.remove(id);
	}

}
