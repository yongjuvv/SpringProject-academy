package com.ch.project.dao;

import java.util.List;
import com.ch.project.model.pj_Board;

public interface BoardDao {
	
	//	List<Board> list(int startRow, int endRow);
	List<pj_Board> boardList(pj_Board pj_board);
	int boardInsert(pj_Board pj_board);
	void boardUpdateReadCount(int b_num);
	pj_Board boardSelect(int b_num);
	int boardGetTotal(pj_Board pj_board);
	int boardUpdate(pj_Board pj_board);
	int boardDelete(int b_num);
	int boardMaxNum();
//	void updateStep(pj_Board pj_board);
	
}