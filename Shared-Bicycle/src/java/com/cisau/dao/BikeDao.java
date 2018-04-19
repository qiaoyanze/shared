package com.cisau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cisau.model.Bike;

public interface BikeDao {

	int insert(Bike bike);
	
	int update(Bike bike);
	
	Bike queryByCode(String bikeCode);
	
	int count();

	List<Bike> queryList(@Param("pageOffset") int pageOffset, @Param("pageSize") int pageSize);
}
