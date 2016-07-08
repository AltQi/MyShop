package me.qxd.service.impl;

import java.util.ArrayList;
import java.util.List;
import me.qxd.dao.MenuMapper;
import me.qxd.domain.Menu;
import me.qxd.service.MenuServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("menuService")
public class MenuServiceImpl implements MenuServiceI {

    @Autowired
    private MenuMapper menuMapper;//注入dao


	@Override
	public List<Menu> allTreeNode() {
	
		return menuMapper.getAllMenu();
		
	}


	@Override
	public List<Menu> treegrid() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void remove(String id) {
		// TODO Auto-generated method stub
		 menuMapper.remove(id);
	}


	@Override
	public int add(Menu menu) {
		// TODO Auto-generated method stub
		return menuMapper.addMenu(menu);
	}


	@Override
	public void edit(Menu menu) {
		// TODO Auto-generated method stub
		 menuMapper.editMenu(menu);
	}


}
