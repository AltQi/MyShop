package me.qxd.dao;

import java.util.List;

import me.qxd.domain.Province;



public interface ProvinceMapper {
    int deleteByPrimaryKey(Integer proId);

    int insert(Province record);

    int insertSelective(Province record);

    Province selectByPrimaryKey(Integer proId);

    int updateByPrimaryKeySelective(Province record);

    int updateByPrimaryKey(Province record);
    List<Province> getAllPro();
}