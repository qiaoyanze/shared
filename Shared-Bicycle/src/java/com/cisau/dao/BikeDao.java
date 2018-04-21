package com.cisau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cisau.model.Bike;
import com.cisau.model.RentBike;
import com.cisau.model.RepairBike;
import com.cisau.model.RepairBikeDto;

public interface BikeDao {

	int insert(Bike bike);
	
	int insertRentBike(RentBike rentBike);
	
	int insertRepairBike(RepairBike repairBike);

	int update(Bike bike);
	
	int updateRentBike(RentBike rentBike);

	Bike queryByCode(String bikeCode);
	
	Bike queryRentingBike(String account);

	int count();

	List<Bike> queryList(@Param("pageOffset") int pageOffset, @Param("pageSize") int pageSize);

	int countRepairBike();

	List<RepairBikeDto> queryRepairBikes(@Param("pageOffset") int pageOffset, @Param("pageSize") int pageSize);

	int countNearBike(String geoCode);

	List<Bike> queryNearBikes(@Param("geoCode") String geoCode, @Param("pageOffset") int pageOffset, @Param("pageSize") int pageSize);
}
