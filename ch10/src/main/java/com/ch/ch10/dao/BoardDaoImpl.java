package com.ch.ch10.dao;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch10.model.Board;
@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate sst;
//	public int getTotal() {
//		return sst.selectOne("boardns.getTotal");
//	}
	public int getTotal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}
//	public Collection<Board> list(int startRow, int endRow) {
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		return sst.selectList("boardns.list", map);
//	}
	public Collection<Board> list(Board board) {
		return sst.selectList("boardns.list", board);
	}
	public int insert(Board board) {
		return sst.insert("boardns.insert",board);
	}
	public Board select(int num) {
		return sst.selectOne("boardns.select", num);
	}
	public void updateReadCount(int num) {
		sst.update("boardns.updateReadCount",num);		
	}
	public int update(Board board) {
		return sst.update("boardns.update", board);
	}
	public int delete(int num) {
		return sst.update("boardns.delete", num);
	}
	public int maxNum() {
		return sst.selectOne("boardns.maxNum");
	}
	public void updateStep(Board board) {
		sst.update("boardns.updateStep",board);
	}
}


