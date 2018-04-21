package com.cisau.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cisau.common.model.Pager;
import com.cisau.dao.BikeDao;
import com.cisau.dao.UserDao;
import com.cisau.model.Bike;
import com.cisau.model.RentBike;
import com.cisau.model.RepairBike;
import com.cisau.model.RepairBikeDto;
import com.cisau.model.UserInfo;

@Service
public class BikeService {

	@Autowired
	private BikeDao dao;
	@Autowired
	private UserDao userDao;
	
	@Transactional
	public int insert(Bike bike) {
		bike.setBikeCode(String.valueOf(RandomUtils.nextInt(1000000, 10000000)));
		bike.setBikePassword(String.valueOf(RandomUtils.nextInt(1000, 10000)));
		String place = bike.getPlace();
		String[] split = place.split(",");
		bike.setGeoCode(split[0]);
		bike.setPlace(split[1]);
		bike.setStatus(1);
		return this.dao.insert(bike);
	}
	
	@Transactional
	public int update(Bike bike,String account) {
		if (4 == bike.getStatus()) {
			return this.dao.update(bike);
		}
		
		String place = bike.getPlace();
		String[] split = place.split(",");
		bike.setGeoCode(split[0]);
		bike.setPlace(split[1]);
		int i = this.dao.update(bike);
		
		// 租车
		if (2 == bike.getStatus()) {
			RentBike rentBike = new RentBike();
			rentBike.setAccount(account);
			rentBike.setBikeCode(bike.getBikeCode());
			rentBike.setRentTime(new Date());
			this.dao.insertRentBike(rentBike);
		}
		
		// 还车
		if (1 == bike.getStatus()) {
			RentBike rentBike = new RentBike();
			rentBike.setAccount(account);
			rentBike.setBikeCode(bike.getBikeCode());
			rentBike.setReturnTime(new Date());
			rentBike.setReturnPlace(split[1]);
			this.dao.updateRentBike(rentBike);
			// 金额减一元
			UserInfo userInfo = this.userDao.queryUserInfoByAccount(account);
			userInfo.setBalance(userInfo.getBalance().subtract(BigDecimal.ONE));
			this.userDao.updateUserInfo(userInfo);
		}
		
		// 报修
		if (3 == bike.getStatus()) {
			RepairBike repairBike = new RepairBike();
			repairBike.setAccount(account);
			repairBike.setBikeCode(bike.getBikeCode());
			repairBike.setRepairPlace(split[1]);
			repairBike.setRepairTime(new Date());
			
			this.dao.insertRepairBike(repairBike);
		}
		
		return i;
	}
	
	public Bike queryByCode(String bikeCode) {
		return this.dao.queryByCode(bikeCode);
	}
	
	public Bike queryRentingBike(String account) {
		return this.dao.queryRentingBike(account);
	}
	
	public Pager list() {
		Pager pager = new Pager();
		pager.init(this.dao.count());
		List<Bike> datas = this.dao.queryList(pager.getPageOffset(), pager.getPageSize());
		pager.setDatas(datas);
		return pager;
	}

	public Pager repairList() {
		Pager pager = new Pager();
		pager.init(this.dao.countRepairBike());
		List<RepairBikeDto> datas = this.dao.queryRepairBikes(pager.getPageOffset(), pager.getPageSize());
		pager.setDatas(datas);
		return pager;
	}
}
