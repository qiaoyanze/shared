package com.cisau.service;

import java.util.List;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cisau.common.model.Pager;
import com.cisau.dao.BikeDao;
import com.cisau.model.Bike;

@Service
public class BikeService {

	@Autowired
	private BikeDao dao;
	
	@Transactional
	public int insert(Bike bike) {
		bike.setBikeCode(String.valueOf(RandomUtils.nextInt(1000000, 10000000)));
		bike.setBikePassword(String.valueOf(RandomUtils.nextInt(1000, 10000)));
		bike.setStatus(1);
		return this.dao.insert(bike);
	}
	
	@Transactional
	public int update(Bike bike) {
		return this.dao.update(bike);
	}
	
	public Bike queryByCode(String bikeCode) {
		return this.dao.queryByCode(bikeCode);
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
		List<Bike> datas = this.dao.queryRepairBikes(pager.getPageOffset(), pager.getPageSize());
		pager.setDatas(datas);
		return pager;
	}
}
