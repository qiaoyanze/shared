package com.cisau.model;

import java.util.Date;

public class RentBike {

	private String account;
	private String bikeCode;
	private Date rentTime; // 租车时间
	private Date returnTime; // 换车时间
	private double returnPlace;// 还车地点

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getBikeCode() {
		return bikeCode;
	}

	public void setBikeCode(String bikeCode) {
		this.bikeCode = bikeCode;
	}

	public Date getRentTime() {
		return rentTime;
	}

	public void setRentTime(Date rentTime) {
		this.rentTime = rentTime;
	}

	public Date getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	public double getReturnPlace() {
		return returnPlace;
	}

	public void setReturnPlace(double returnPlace) {
		this.returnPlace = returnPlace;
	}
}
