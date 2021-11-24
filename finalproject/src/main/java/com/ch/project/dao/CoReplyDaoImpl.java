package com.ch.project.dao;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.CoReply;

@Repository
public class CoReplyDaoImpl implements CoReplyDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Collection<CoReply> list(int reviewNum) {
		return sst.selectList("coreplyns.list", reviewNum);
	}

	@Override
	public void insert(CoReply coreply) {
		sst.insert("coreplyns.insert", coreply);
	}

	@Override
	public void delete(int coReplyNum) {
		sst.delete("coreplyns.delete", coReplyNum);
	}

	@Override
	public void update(CoReply coreply) {
		sst.update("coreplyns.update", coreply);
	}

	@Override
	public int replycount(int reviewNum) {
		return sst.selectOne("coreplyns.replycount", reviewNum);
	}

}
