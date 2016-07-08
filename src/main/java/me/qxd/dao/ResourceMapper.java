package me.qxd.dao;

import java.util.List;

import me.qxd.domain.Resource;

public interface ResourceMapper {
    int deleteByPrimaryKey(String id);

    int insert(Resource record);
   

    int insertSelective(Resource record);

    Resource selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKey(Resource record);

	List<Resource> allTreeNode();

	void  add(Resource resource);

	void edit(Resource resource);

	void remove(String id);
}