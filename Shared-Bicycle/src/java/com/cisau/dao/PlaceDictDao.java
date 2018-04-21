package com.cisau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cisau.model.PlaceDict;

public interface PlaceDictDao {

	int insert(PlaceDict dict);
	
	int count();

	List<PlaceDict> queryList(@Param("pageOffset") int pageOffset, @Param("pageSize") int pageSize);

	PlaceDict queryByName(String name);
	
	List<PlaceDict> queryDicts();

	void delete(String name);
}
