package com.ch.project.model;

import java.sql.Timestamp;

public class Pay {
	private int payNum;
	private String email;
	private int tvNum;
	private int tvEpNum;
	private int movNum;
	private Timestamp payDate;
	private String payState;
	
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int gettvNum() {
		return tvNum;
	}
	public void tvNum(int tvNum) {
		this.tvNum = tvNum;
	}
	public int getMovNum() {
		return movNum;
	}
	public void setMovNum(int movNum) {
		this.movNum = movNum;
	}

	public Timestamp getPayDate() {
		return payDate;
	}
	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	public String getPayState() {
		return payState;
	}
	public void setPayState(String payState) {
		this.payState = payState;
	}
	public int getTvEpNum() {
		return tvEpNum;
	}
	public void setTvEpNum(int tvEpNum) {
		this.tvEpNum = tvEpNum;
	}
}
