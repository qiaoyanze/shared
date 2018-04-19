package com.cisau.service;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cisau.common.model.Pager;
import com.cisau.dao.UserDao;
import com.cisau.model.User;
import com.cisau.model.UserInfo;

@Service
public class UserService {

	@Autowired
	private UserDao dao;

	public User queryByAccount(String account) {
		return this.dao.queryUserByAccount(account);
	}

	public Pager list() {
		Pager pager = new Pager();
		pager.init(this.dao.countUsers());
		List<User> datas = this.dao.queryUsers(pager.getPageOffset(), pager.getPageSize());
		pager.setDatas(datas);
		return pager;
	}

	@Transactional
	public int save(User user) {
		user.setStatus(1);
		int i = this.dao.insertUser(user);

		UserInfo userInfo = new UserInfo();
		userInfo.setAccount(user.getAccount());
		userInfo.setNickname("GX_" + user.getAccount());
		userInfo.setBalance(BigDecimal.ZERO);
		this.dao.insertUserInfo(userInfo);

		return i;
	}
	
	@Transactional
	public int update(User user) {
		int i = this.updateUser(user);
		this.updateUserInfo(user.getUserInfo());
		return i;
	}
	
	@Transactional
	public int updateUser(User user) {
		return this.dao.updateUser(user);
	}
	
	@Transactional
	public int updateUserInfo(UserInfo userInfo) {
		return this.dao.updateUserInfo(userInfo);
	}

	public User login(String account, String password) {
		User user = this.dao.queryUserByAccount(account);
		if (user == null) {
			return null;
		}

		if (StringUtils.equals(password, user.getPassword())) {
			UserInfo userInfo = this.dao.queryUserInfoByAccount(account);
			user.setUserInfo(userInfo);
			return user;
		}

		return null;
	}
}
