package com.cisau.model;

import java.util.Date;

public class RepairBikeDto {

	private String account;
	private String bikeCode;
	private String bikeBrand;
	private Date rentTime;
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

	public String getBikeBrand() {
		return bikeBrand;
	}

	public void setBikeBrand(String bikeBrand) {
		this.bikeBrand = bikeBrand;
	}

	public Date getRentTime() {
		return rentTime;
	}

	public void setRentTime(Date rentTime) {
		this.rentTime = rentTime;
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
