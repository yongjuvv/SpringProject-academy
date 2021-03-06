package com.ch.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class HelpBoard {
	private String id;
	private int hb_number;
	private String hb_writer;
	private String hb_subject;
	private String hb_content;
	private int hb_readcount;
	private int hb_ref;
	private int hb_re_step;
	private int hb_re_level;
	private Date hb_reg_date;
	private String hb_del;
	//paging
	private int startRow;
	private int endRow;
	//검색용
	private String search;
	private String keyword;
}
