package me.qxd.service;

import java.util.List;

import me.qxd.domain.Menu;

public interface MenuServiceI {
	public List<Menu> allTreeNode();

	public List<Menu> treegrid();

	public void remove(String id);

	public int add(Menu menu);

	public void edit(Menu menu);

}
