package com.ch.ch10.dao;
import java.util.Collection;
import com.ch.ch10.model.ReplyBoard;
public interface ReplyBoardDao {
	Collection<ReplyBoard> list(int bno);
	void insert(ReplyBoard rb);
	void update(ReplyBoard rb);
	void delete(int rno);

}