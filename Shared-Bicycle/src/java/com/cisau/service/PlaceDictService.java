package com.cisau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cisau.common.model.Pager;
import com.cisau.dao.PlaceDictDao;
import com.cisau.model.PlaceDict;
import com.spatial4j.core.io.GeohashUtils;

@Service
public class PlaceDictService {

	@Autowired
	private PlaceDictDao dao;
	
	public List<PlaceDict> queryDicts() {
		return this.dao.queryDicts();
	}
	
	public Pager list() {
		Pager pager = new Pager();
		pager.init(this.dao.count());
		List<PlaceDict> datas = this.dao.queryList(pager.getPageOffset(), pager.getPageSize());
		pager.setDatas(datas);
		return pager;
	}

	@Transactional
	public int insert(PlaceDict dict) {
		String geoCode = GeohashUtils.encodeLatLon(dict.getLat(), dict.getLon(), 5);
		dict.setGeoCode(geoCode);
		return this.dao.insert(dict);
	}
	
	public void delete(String name) {
		this.dao.delete(name);
	}
	
	public PlaceDict queryByName(String name) {
		return this.dao.queryByName(name);
	}
}
