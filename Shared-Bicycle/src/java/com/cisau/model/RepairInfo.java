package com.cisau.model;

import java.io.Serializable;

public class RepairInfo implements Serializable {

	private static final long serialVersionUID = 8421588276588766685L;
	
	private String account;
	private String realname;
	private String idNo;
	private String mobile;
	private int gender; // 性别-1:男，2：女
	private String birthday; // 出生日期
	private int isPass; // 是否通过-1:待审核，2: 审核通过，3：拒绝

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public int getIsPass() {
		return isPass;
	}

	public void setIsPass(int isPass) {
		this.isPass = isPass;
	}
}
