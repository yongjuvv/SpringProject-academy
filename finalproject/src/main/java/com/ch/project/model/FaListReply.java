package com.ch.project.model;

import java.sql.Timestamp;

public class FaListReply {
	private int faReplyNum;
	private int faNum;
	private String faReEmail;
	private Timestamp faReDate;
	private Timestamp faReUpdate;
	private String faReCont;
	private String faReDel;

	public int getFaReplyNum() {
		return faReplyNum;
	}

	public void setFaReplyNum(int faReplyNum) {
		this.faReplyNum = faReplyNum;
	}

	public int getFaNum() {
		return faNum;
	}

	public void setFaNum(int faNum) {
		this.faNum = faNum;
	}

	public String getFaReEmail() {
		return faReEmail;
	}

	public void setFaReEmail(String faReEmail) {
		this.faReEmail = faReEmail;
	}

	public Timestamp getFaReDate() {
		return faReDate;
	}

	public void setFaReDate(Timestamp faReDate) {
		this.faReDate = faReDate;
	}

	public Timestamp getFaReUpdate() {
		return faReUpdate;
	}

	public void setFaReUpdate(Timestamp faReUpdate) {
		this.faReUpdate = faReUpdate;
	}

	public String getFaReCont() {
		return faReCont;
	}

	public void setFaReCont(String faReCont) {
		this.faReCont = faReCont;
	}

	public String getFaReDel() {
		return faReDel;
	}

	public void setFaReDel(String faReDel) {
		this.faReDel = faReDel;
	}
}
