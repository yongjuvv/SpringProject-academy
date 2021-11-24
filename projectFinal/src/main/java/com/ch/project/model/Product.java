package com.ch.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Product {

	private int p_Number;
	private String p_Name;
	private int p_Price;
	private int p_Quantity;
	private Date p_Regdate;
	private String p_Color;
	private String p_pcName;
	
	
}
