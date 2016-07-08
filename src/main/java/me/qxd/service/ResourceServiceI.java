package me.qxd.service;

import java.util.List;

import me.qxd.domain.Resource;

public interface ResourceServiceI {

	List<Resource> allTreeNode();

	void add(Resource resource);

	void edit(Resource resource);

	void remove(String id);

}
