package com.cisau.model;

import java.util.Date;

public class Bike {

	private String bikeCode;
	private String bikePassword;
	private double place; // 投放点
	private int isRepair; // 是否报修 0：未报修，1：已报修
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

	public double getPlace() {
		return place;
	}

	public void setPlace(double place) {
		this.place = place;
	}

	public int getIsRepair() {
		return isRepair;
	}

	public void setIsRepair(int isRepair) {
		this.isRepair = isRepair;
	}

	public Date getRepairTime() {
		return repairTime;
	}

	public void setRepairTime(Date repairTime) {
		this.repairTime = repairTime;
	}
}
