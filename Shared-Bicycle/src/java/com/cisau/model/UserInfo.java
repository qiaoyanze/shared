package com.cisau.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class UserInfo implements Serializable {

	private static final long serialVersionUID = 2777135039658179881L;

	private String account;
	private String nickname;
	private int gender; // 性别-1:男，2：女
	private String birthday; // 出生日期
	private BigDecimal balance;
	private int status; // 是否激活-1：激活，2：冻结

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
