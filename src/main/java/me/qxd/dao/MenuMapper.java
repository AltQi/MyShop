package me.qxd.dao;

import java.util.List;

import me.qxd.domain.Menu;

public interface MenuMapper {
    int deleteByPrimaryKey(String id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

	List<Menu> getAllMenu();

	int addMenu(Menu record);

	int editMenu(Menu menu);

	void remove(String id);
}