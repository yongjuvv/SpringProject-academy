package com.ch.project.model;

import java.sql.Date;
import lombok.Data;
@Data

public class ReplyBoard {
	private int rno;
	private int b_num;
	private String id;
	private String r_content;
	private Date r_regdate;
	private Date r_updatedate;
	private String r_del;
}