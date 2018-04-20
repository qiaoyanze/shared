package com.cisau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cisau.common.model.Pager;
import com.cisau.dao.UserDao;
import com.cisau.model.RepairInfo;
import com.cisau.model.User;

@Service
public class RepairService {

	@Autowired
	private UserDao dao;
	
	@Transactional
	public int update(RepairInfo repairInfo) {
		return this.dao.updateRepairInfo(repairInfo);
	}
	
	public Pager list() {
		Pager pager = new Pager();
		pager.init(this.dao.countRepairUsers(2));
		List<User> datas = this.dao.queryRepairUsers(2, pager.getPageOffset(), pager.getPageSize());
		pager.setDatas(datas);
		return pager;
	}
	
	public RepairInfo info(String account) {
		RepairInfo repairInfo = this.dao.queryRepairInfoByAccount(account);
		return repairInfo;
	}
}
