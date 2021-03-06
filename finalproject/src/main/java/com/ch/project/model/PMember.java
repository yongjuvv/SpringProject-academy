package com.ch.project.model;

import java.sql.Date;

public class PMember {
	private String email;
	private String pass;
	private String memName;
	private String nickName;
	private String memPic;
	private Date memBirth;
	private int memPoint;
	private Date regDate;
	private String memDel;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemDel() {
		return memDel;
	}

	public void setMemDel(String memDel) {
		this.memDel = memDel;
	}

	public int getMemPoint() {
		return memPoint;
	}

	public void setMemPoint(int memPoint) {
		this.memPoint = memPoint;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getMemPic() {
		return memPic;
	}

	public void setMemPic(String memPic) {
		this.memPic = memPic;
	}

	public Date getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(Date memBirth) {
		this.memBirth = memBirth;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public int getpProductNum() {
		return pProductNum;
	}

	public void setpProductNum(int pProductNum) {
		this.pProductNum = pProductNum;
	}

	public int getpProductPoint() {
		return pProductPoint;
	}

	public void setpProductPoint(int pProductPoint) {
		this.pProductPoint = pProductPoint;
	}

	public int getMovNum() {
		return movNum;
	}

	public void setMovNum(int movNum) {
		this.movNum = movNum;
	}

	public int getMovPrice() {
		return movPrice;
	}

	public void setMovPrice(int movPrice) {
		this.movPrice = movPrice;
	}

	private int pProductNum;
	private int pProductPoint;
	private int movNum;
	private int movPrice; 
	private int tvNum;
	public int getTvNum() {
		return tvNum;
	}

	public void setTvNum(int tvNum) {
		this.tvNum = tvNum;
	}

	public int getTvEpNum() {
		return tvEpNum;
	}

	public void setTvEpNum(int tvEpNum) {
		this.tvEpNum = tvEpNum;
	}

	public int getTvPrice() {
		return tvPrice;
	}

	public void setTvPrice(int tvPrice) {
		this.tvPrice = tvPrice;
	}

	private int tvEpNum;
	private int tvPrice; 
}
