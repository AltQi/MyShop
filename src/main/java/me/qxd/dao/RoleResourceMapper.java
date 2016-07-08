package me.qxd.dao;

import java.util.List;

import me.qxd.domain.Role;
import me.qxd.domain.RoleResource;


public interface RoleResourceMapper {
    int deleteByPrimaryKey(String id);
    int deleteByrole(RoleResource record);

    int insert(RoleResource record);

    int insertSelective(RoleResource record);

    RoleResource selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(RoleResource record);

    int updateByPrimaryKey(RoleResource record);

	List<RoleResource>   getPageUser(Role role);

	RoleResource find(RoleResource roleresource);

	
}