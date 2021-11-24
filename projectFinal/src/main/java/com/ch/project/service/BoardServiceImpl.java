package com.ch.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.project.dao.BoardDao;
import com.ch.project.model.pj_Board;
@Service

public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;
//	public List<Board> list(int startRow, int endRow) {
//		return bd.list(startRow, endRow);
//	}
	public List<pj_Board> boardList(pj_Board pj_board) {
		return bd.boardList(pj_board);
	}
	public int boardInsert(pj_Board pj_board) {
		return bd.boardInsert(pj_board);
	}
	public void boardUpdateReadCount(int b_num) {
		bd.boardUpdateReadCount(b_num);
	}
	public pj_Board boardSelect(int b_num) {
		return bd.boardSelect(b_num);
	}
	public int boardGetTotal(pj_Board pj_board) {
		return bd.boardGetTotal(pj_board);
	}
	public int boardUpdate(pj_Board pj_board) {
		return bd.boardUpdate(pj_board);
	}
	public int boardDelete(int b_num) {
		return bd.boardDelete(b_num);
	}
	public int boardMaxNum() {
		return bd.boardMaxNum();
	}
//	public void updateStep(pj_Board pj_board) {
//		bd.updateStep(pj_board);
//	}
}