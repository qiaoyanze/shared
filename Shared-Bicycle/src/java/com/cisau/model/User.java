package com.cisau.model;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 5587743650727874749L;

	private String account;
	private String password;
	private int role; // 1:管理员，2：维修人员，3：用户
	private UserInfo userInfo;
	private RepairInfo repairInfo;

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

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public RepairInfo getRepairInfo() {
		return repairInfo;
	}

	public void setRepairInfo(RepairInfo repairInfo) {
		this.repairInfo = repairInfo;
	}
	
	public static final int ROLE_ADMIN = 1;
	public static final int ROLE_REPAIR = 2;
	public static final int ROLE_USER = 3;
}
