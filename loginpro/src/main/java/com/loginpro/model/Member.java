package com.loginpro.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String passward;
	private String name;
	private String sex;
	private String address;
	private String email;
	private String phoneNumber;
	private Date joindate;
	private String del;
	
}
