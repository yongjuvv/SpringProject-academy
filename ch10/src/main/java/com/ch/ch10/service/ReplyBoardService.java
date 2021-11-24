package com.ch.ch10.service;
import java.util.Collection;
import com.ch.ch10.model.ReplyBoard;
public interface ReplyBoardService {
	Collection<ReplyBoard> list(int bno);
	void insert(ReplyBoard rb);
	void update(ReplyBoard rb);
	void delete(int rno);

}