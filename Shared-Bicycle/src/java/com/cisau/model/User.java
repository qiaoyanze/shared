package com.cisau.model;

public class User {

	private String account;
	private String password;
	private int role; // 1:管理员，2：维修人员，3：用户
	private double place; // 所处位置

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

	public double getPlace() {
		return place;
	}

	public void setPlace(double place) {
		this.place = place;
	}
}
