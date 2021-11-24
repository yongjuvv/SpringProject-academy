package com.ch.ch09.dao;
import java.util.Collection;
import java.util.List;

import com.ch.ch09.model.Board;
public interface BoardDao {
//	int getTotal();
	int getTotal(Board board);
//	Collection<Board> list(int startRow, int endRow);
	List<Board> list(Board board);
	int insert(Board board);
	Board select(int num);
	void updateReadCount(int num);
	int update(Board board);
	int delete(int num);
	int maxNum();
	void updateStep(Board board);

}