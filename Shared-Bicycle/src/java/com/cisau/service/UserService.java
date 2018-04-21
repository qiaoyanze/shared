package com.cisau.service;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cisau.common.model.Pager;
import com.cisau.dao.BikeDao;
import com.cisau.dao.UserDao;
import com.cisau.model.Bike;
import com.cisau.model.RepairBikeDto;
import com.cisau.model.RepairInfo;
import com.cisau.model.User;
import com.cisau.model.UserInfo;

@Service
public class UserService {

	@Autowired
	private UserDao dao;
	@Autowired
	private BikeDao bikeDao;

	public User queryByAccount(String account) {
		return this.dao.queryUserByAccount(account);
	}

	public UserInfo info(String account) {
		UserInfo userInfo = this.dao.queryUserInfoByAccount(account);
		return userInfo;
	}
	
	public Pager list() {
		Pager pager = new Pager();
		pager.init(this.dao.countUsers(3));
		List<User> datas = this.dao.queryUsers(3, pager.getPageOffset(), pager.getPageSize());
		pager.setDatas(datas);
		return pager;
	}

	@Transactional
	public int save(User user) {
		int i = this.dao.insertUser(user);
		if (User.ROLE_USER == user.getRole()) {
			UserInfo userInfo = user.getUserInfo();
			userInfo.setAccount(user.getAccount());
			if (StringUtils.isEmpty(userInfo.getNickname())) {
				userInfo.setNickname("GX_" + user.getAccount());
			}
			userInfo.setBalance(BigDecimal.ZERO);
			userInfo.setStatus(1);
			if (StringUtils.isEmpty(userInfo.getBirthday())) {
				userInfo.setBirthday(null);
			}
			this.dao.insertUserInfo(userInfo);
		}
		
		if (User.ROLE_REPAIR == user.getRole()) {
			RepairInfo repairInfo = user.getRepairInfo();
			repairInfo.setAccount(user.getAccount());
			if (StringUtils.isEmpty(repairInfo.getBirthday())) {
				repairInfo.setBirthday(null);
			}
			this.dao.insertRepairInfo(repairInfo);
		}

		return i;
	}

	@Transactional
	public int updateUser(User user) {
		return this.dao.updateUser(user);
	}

	@Transactional
	public int updateUserInfo(UserInfo userInfo) {
		UserInfo info = this.dao.queryUserInfoByAccount(userInfo.getAccount());
		if (info.getBalance() != null) {
			userInfo.setBalance(info.getBalance().add(userInfo.getBalance()));
		}
		return this.dao.updateUserInfo(userInfo);
	}

	public User login(String account, String password) {
		User user = this.dao.queryUserByAccount(account);
		if (user == null) {
			return null;
		}

		if (StringUtils.equals(password, user.getPassword())) {
			if (User.ROLE_ADMIN == user.getRole()) {
				return user;
			}
			
			if (User.ROLE_USER == user.getRole()) {
				UserInfo userInfo = this.dao.queryUserInfoByAccount(account);
				user.setUserInfo(userInfo);
				return user;
			}
			
			if (User.ROLE_REPAIR == user.getRole()) {
				RepairInfo repairInfo = this.dao.queryRepairInfoByAccount(account);
				user.setRepairInfo(repairInfo);
				return user;
			}
		}

		return null;
	}

	public Pager nearBikeList(String place) {
		String[] split = place.split(",");
		Pager pager = new Pager();
		pager.init(this.bikeDao.countNearBike(split[0]));
		List<Bike> datas = this.bikeDao.queryNearBikes(split[0], pager.getPageOffset(), pager.getPageSize());
		pager.setDatas(datas);
		return pager;
	}

	public Pager myRepairBikeList(String account) {
		Pager pager = new Pager();
		pager.init(this.dao.countRepairBikesByAccount(account));
		List<RepairBikeDto> datas = this.dao.queryRepairBikesByAccount(account,pager.getPageOffset(), pager.getPageSize());
		pager.setDatas(datas);
		return pager;
	}
}
