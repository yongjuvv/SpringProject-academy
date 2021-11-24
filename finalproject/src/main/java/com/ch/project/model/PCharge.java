package com.ch.project.model;

import java.sql.Timestamp;

public class PCharge {
	private int pChargeNum;
	private int pProductNum;
	private String email;
	private Timestamp pChargeDate;
	private String pDesc;
	private int pProductPoint;
	private int tvEpNum;
	private int tvEpPrice;
	private int movPrice;
	
	public int getTvEpNum() {
		return tvEpNum;
	}

	public void setTvEpNum(int tvEpNum) {
		this.tvEpNum = tvEpNum;
	}

	public int getTvEpPrice() {
		return tvEpPrice;
	}

	public void setTvEpPrice(int tvEpPrice) {
		this.tvEpPrice = tvEpPrice;
	}

	public int getMovPrice() {
		return movPrice;
	}

	public void setMovPrice(int movPrice) {
		this.movPrice = movPrice;
	}

	public int getpProductNum() {
		return pProductNum;
	}

	public void setpProductNum(int pProductNum) {
		this.pProductNum = pProductNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getpChargeNum() {
		return pChargeNum;
	}

	public void setpChargeNum(int pChargeNum) {
		this.pChargeNum = pChargeNum;
	}

	public Timestamp getpChargeDate() {
		return pChargeDate;
	}

	public void setpChargeDate(Timestamp pChargeDate) {
		this.pChargeDate = pChargeDate;
	}
	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public int getpProductPoint() {
		return pProductPoint;
	}

	public void setpProductPoint(int pProductPoint) {
		this.pProductPoint = pProductPoint;
	}
	

}
