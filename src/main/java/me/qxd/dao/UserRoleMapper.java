package me.qxd.dao;

import me.qxd.domain.User;
import me.qxd.domain.UserRole;

public interface UserRoleMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserRole record);

    int insertSelective(UserRole record);
    int selecto(UserRole record);
    int updateo(UserRole record);
    UserRole selectByPrimaryKey(String id);
    int inserta(UserRole record);
    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}