package com.ch.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.project.dao.ReplyBoardDao;
import com.ch.project.model.ReplyBoard;
@Service

public class ReplyBoardServiceImpl implements ReplyBoardService{
	@Autowired
	private ReplyBoardDao rbd;
	
	public List<ReplyBoard> rbdList(int b_num) {
		return rbd.rbdList(b_num);
	}
	public void rInsert(ReplyBoard rb) {
		rbd.rInsert(rb);		
	}
	public void rDelete(ReplyBoard rb) {
		rbd.rDelete(rb);
	}
	public void rUpdate(ReplyBoard rb) {
		rbd.rUpdate(rb);
	}
	
}