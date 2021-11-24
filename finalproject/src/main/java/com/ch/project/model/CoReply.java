package com.ch.project.model;

import java.util.Date;

public class CoReply {
	private int reviewNum;
	private int coReplyNum;
	private String email;
	private String coReEmail;
	private Date coReDate;
	private Date coReUpdate;
	private String coReCont;
	private String coReDel;
	private String nickName;
	
	public int getCoReplyNum() {
		return coReplyNum;
	}
	public void setCoReplyNum(int coReplyNum) {
		this.coReplyNum = coReplyNum;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCoReEmail() {
		return coReEmail;
	}
	public void setCoReEmail(String coReEmail) {
		this.coReEmail = coReEmail;
	}
	public Date getCoReDate() {
		return coReDate;
	}
	public void setCoReDate(Date coReDate) {
		this.coReDate = coReDate;
	}
	public Date getcoReUpdate() {
		return coReUpdate;
	}
	public void setCoReUpdate(Date coReUpdate) {
		this.coReUpdate = coReUpdate;
	}
	public String getCoReCont() {
		return coReCont;
	}
	public void setCoReCont(String coReCont) {
		this.coReCont = coReCont;
	}
	public String getCoReDel() {
		return coReDel;
	}
	public void setCoReDel(String coReDel) {
		this.coReDel = coReDel;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

}
