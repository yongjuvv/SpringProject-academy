package com.ch.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyProductBoard {
	private int pbrno;
	private int pNumber;
	private String pbr_writer;
	private String id;
	private String pbr_content;
	private Date pbr_regdate;
	private Date pbr_updatedate;
	private String pbr_del;
}
