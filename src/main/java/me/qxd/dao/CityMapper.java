package me.qxd.dao;

import java.util.List;

import me.qxd.domain.City;



public interface CityMapper {
    int deleteByPrimaryKey(Integer cityId);

    int insert(City record);

    int insertSelective(City record);

    City selectByPrimaryKey(Integer cityId);

    int updateByPrimaryKeySelective(City record);

    int updateByPrimaryKey(City record);
    List<City> getAllCity(City city);
}