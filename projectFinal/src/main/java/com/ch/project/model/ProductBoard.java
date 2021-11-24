package com.ch.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductBoard {

	private int pbLike; // 좋아yo
	private String pbIp; // 아이피
	private Date pbRegdate;
	private int pbDel;
	
}
