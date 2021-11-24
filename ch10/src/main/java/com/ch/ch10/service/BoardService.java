package com.ch.ch10.service;
import java.util.Collection;

import com.ch.ch10.model.Board;
public interface BoardService {
//	int getTotal();
	int getTotal(Board board);
//	Collection<Board> list(int startRow, int endRow);
	Collection<Board> list(Board board);
	int insert(Board board);
	void updateReadCount(int num);
	Board select(int num);
	int update(Board board);
	int delete(int num);
	int maxNum();
	void updateStep(Board board);

}