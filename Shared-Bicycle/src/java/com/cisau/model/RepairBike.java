package com.cisau.model;

import java.util.Date;

public class RepairBike {

	private String account;
	private String bikeCode;
	private String repairPlace;
	private Date repairTime;

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

	public String getRepairPlace() {
		return repairPlace;
	}

	public void setRepairPlace(String repairPlace) {
		this.repairPlace = repairPlace;
	}

	public Date getRepairTime() {
		return repairTime;
	}

	public void setRepairTime(Date repairTime) {
		this.repairTime = repairTime;
	}
}
