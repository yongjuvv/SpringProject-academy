package com.ch.project.dao;

import java.util.Collection;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.ReplyProductBoard;

@Repository
public class ReplyProductBoardDaoImpl implements ReplyProductBoardDao{
	@Autowired
	private SqlSessionTemplate sst;

	public Collection<ReplyProductBoard> list(int pNumber) {
		return sst.selectList("rpdboardns.list", pNumber);
	}

	public void insert(ReplyProductBoard rpb) {
		sst.insert("rpdboardns.insert", rpb);
	}

	public void update(ReplyProductBoard rpb) {
		sst.update("rpdboardns.update", rpb);
	}

	public void delete(int pbrno) {
		sst.update("rpdboardns.delete", pbrno);
	}

}
