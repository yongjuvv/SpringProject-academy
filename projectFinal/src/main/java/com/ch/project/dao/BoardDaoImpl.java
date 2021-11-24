package com.ch.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ch.project.model.pj_Board;
@Repository

public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate sst;
//	public List<Board> list(int startRow, int endRow) {
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		return sst.selectList("boardns.list", map);
//	}
	public List<pj_Board> boardList(pj_Board pj_board) {
		return sst.selectList("board1ns.boardList", pj_board);
	}
	public int boardInsert(pj_Board pj_board) {
		return sst.insert("board1ns.boardInsert", pj_board);
	}
	public void boardUpdateReadCount(int b_num) {
		sst.update("board1ns.boardUpdateReadCount", b_num);
	}
	public pj_Board boardSelect(int b_num) {
		return sst.selectOne("board1ns.boardSelect", b_num);
	}
	public int boardGetTotal(pj_Board pj_board) {
		return sst.selectOne("board1ns.boardGetToal", pj_board);
	}
	public int boardUpdate(pj_Board pj_board) {
		return sst.update("board1ns.boardUpdate", pj_board);
	}
	public int boardDelete(int b_num) {
		return sst.delete("board1ns.boardDelete", b_num);
	}
	public int boardMaxNum() {
		return sst.selectOne("board1ns.boardMaxNum");
	}
//	public void updateStep(pj_Board pj_board) {
//		sst.update("boardns.updateStep", pj_board);
//	}
}