package com.cisau.model;

import java.util.Date;

public class Bike {

	private String bikeCode;
	private String bikePassword;
	private int bikeBrand; // 单车品牌-1：ofo单车,2：摩拜单车，3：哈罗单车
	private String place; // 投放点
	private int status; // 单车状态- 1：正常，2：报修，3：回收下线
	private Date repairTime; // 报修时间

	public String getBikeCode() {
		return bikeCode;
	}

	public void setBikeCode(String bikeCode) {
		this.bikeCode = bikeCode;
	}

	public String getBikePassword() {
		return bikePassword;
	}

	public void setBikePassword(String bikePassword) {
		this.bikePassword = bikePassword;
	}

	public int getBikeBrand() {
		return bikeBrand;
	}

	public void setBikeBrand(int bikeBrand) {
		this.bikeBrand = bikeBrand;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getStatus() {
		return status;
	}
	
	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getRepairTime() {
		return repairTime;
	}

	public void setRepairTime(Date repairTime) {
		this.repairTime = repairTime;
	}
}
