package com.ch.ch09.service;
import java.util.Collection;
import java.util.List;

import com.ch.ch09.model.Board;
public interface BoardService {
//	int getTotal();
	int getTotal(Board board);
//	Collection<Board> list(int startRow, int endRow);
	List<Board> list(Board board);
	int insert(Board board);
	void updateReadCount(int num);
	Board select(int num);
	int update(Board board);
	int delete(int num);
	int maxNum();
	void updateStep(Board board);

}