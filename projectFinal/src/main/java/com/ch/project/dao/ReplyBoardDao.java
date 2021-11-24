package com.ch.project.dao;

import java.util.List;
import com.ch.project.model.ReplyBoard;

public interface ReplyBoardDao {
	List<ReplyBoard> rbdList(int b_num);
	void rInsert(ReplyBoard rb);
	void rDelete(ReplyBoard rb);
	void rUpdate(ReplyBoard rb);
	
}