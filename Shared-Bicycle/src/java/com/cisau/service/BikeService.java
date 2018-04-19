package com.cisau.service;

import java.util.List;

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
}
