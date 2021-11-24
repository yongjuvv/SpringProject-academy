package com.ch.project.model;

import java.sql.Date;
import lombok.Data;
@Data

public class pj_Board {
	
	private int b_num;
	private String id;
	private String b_subject;
	private String b_content;
//	private String email;
	private int b_readcount;
//	private String password;
//	private int ref;
//	private int re_step;
//	private int re_level;
	private String b_ip;
	private Date b_reg_date;
	private String b_del;
	// paging용
	private int boardStartRow;
	private int boardEndRow;
	// 검색용
	private String boardSearch;
	private String boardKeyword;
	
}