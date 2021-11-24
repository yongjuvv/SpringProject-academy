package com.ch.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.HelpBoard;

@Repository
public class HelpBoardDaoImpl implements HelpBoardDao{
	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal(HelpBoard board) {
		return sst.selectOne("boardns.getTotal", board);
	}

	public List<HelpBoard> list(HelpBoard board) {
		return sst.selectList("boardns.list", board);
	}

	public HelpBoard select(int num) {
		return sst.selectOne("boardns.select", num);
	}

	public int maxNum() {
		return sst.selectOne("boardns.maxNum");
	}

	public int insert(HelpBoard board) {
		return sst.insert("boardns.insert", board);
	}

	public void updateStep(HelpBoard board) {
		sst.update("boardns.updateStep", board);
		
	}
	public int update(HelpBoard board) {
		return sst.update("boardns.update", board);
	}

	@Override
	public void updateReadCount(int num) {
		sst.update("boardns.updateReadCount", num);
	}

	@Override
	public int delete(int num) {
		return sst.update("boardns.delete", num);
	}
	
	
	
}
