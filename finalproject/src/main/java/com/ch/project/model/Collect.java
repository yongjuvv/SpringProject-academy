package com.ch.project.model;

import java.util.Date;

public class Collect {
	private int collNum;
	private String email;
	private String collName;
	private String collDesc;
	private Date collDate;
	private int collVidNum;
	private int movNum;
	private int tvNum;
	private int cartNum;
	private String movName;
	private Date movDate;
	private String movPic;
	private String movGenre1;
	private String nickName;
	
	public String getMovName() {
		return movName;
	}
	public void setMovName(String movName) {
		this.movName = movName;
	}
	public Date getMovDate() {
		return movDate;
	}
	public void setMovDate(Date movDate) {
		this.movDate = movDate;
	}
	public String getMovPic() {
		return movPic;
	}
	public void setMovPic(String movPic) {
		this.movPic = movPic;
	}
	public String getMovGenre1() {
		return movGenre1;
	}
	public void setMovGenre1(String movGenre1) {
		this.movGenre1 = movGenre1;
	}
	public int getCollVidNum() {
		return collVidNum;
	}
	public void setCollVidNum(int collVidNum) {
		this.collVidNum = collVidNum;
	}
	public int getMovNum() {
		return movNum;
	}
	public void setMovNum(int movNum) {
		this.movNum = movNum;
	}
	public int getTvNum() {
		return tvNum;
	}
	public void setTvNum(int tvNum) {
		this.tvNum = tvNum;
	}
	public int getCollNum() {
		return collNum;
	}
	public void setCollNum(int collNum) {
		this.collNum = collNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCollName() {
		return collName;
	}
	public void setCollName(String collName) {
		this.collName = collName;
	}
	public String getCollDesc() {
		return collDesc;
	}
	public void setCollDesc(String collDesc) {
		this.collDesc = collDesc;
	}
	public Date getCollDate() {
		return collDate;
	}
	public void setCollDate(Date collDate) {
		this.collDate = collDate;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
}
