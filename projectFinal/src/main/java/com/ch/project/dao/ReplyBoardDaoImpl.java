package com.ch.project.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ch.project.model.ReplyBoard;
@Repository

public class ReplyBoardDaoImpl implements ReplyBoardDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<ReplyBoard> rbdList(int b_num) {
		return sst.selectList("rbdns.rbdList", b_num);
	}
	public void rInsert(ReplyBoard rb) {
		sst.insert("rbdns.rInsert", rb);
	}
	public void rDelete(ReplyBoard rb) {
		sst.delete("rbdns.rDelete", rb);
	}
	public void rUpdate(ReplyBoard rb) {
		sst.update("rbdns.rUpdate", rb);
	}
}