package com.cisau.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class UserInfo implements Serializable {

	private static final long serialVersionUID = 2777135039658179881L;
	
	private String account;
	private String nickname;
	private String place;
	private BigDecimal balance;

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

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
}
