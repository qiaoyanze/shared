package com.cisau.model;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 5587743650727874749L;

	private String account;
	private String password;
	private int role; // 1:管理员，2：维修人员，3：用户
	private Integer status; // 是否激活-1：激活，0：未激活
	private UserInfo userInfo;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
}
