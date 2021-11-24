package com.ch.ch10.dao;
import java.util.Collection;

import com.ch.ch10.model.Board;
public interface BoardDao {
//	int getTotal();
	int getTotal(Board board);
//	Collection<Board> list(int startRow, int endRow);
	Collection<Board> list(Board board);
	int insert(Board board);
	Board select(int num);
	void updateReadCount(int num);
	int update(Board board);
	int delete(int num);
	int maxNum();
	void updateStep(Board board);

}