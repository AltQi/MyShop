package me.qxd.dao;

import java.util.List;

import me.qxd.domain.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Role record);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	Long getTotalNumber(Role role);

	List<Role> getPageUser(Role role);

	void add(Role role);
	void addone(Role role);
}