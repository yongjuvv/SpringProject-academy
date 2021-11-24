package com.ch.project.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.ReplyProductBoardDao;
import com.ch.project.model.ReplyProductBoard;

@Service
public class ReplyProductBoardServiceImpl implements ReplyProductBoardService{
	@Autowired
	private ReplyProductBoardDao rpbd;

	@Override
	public Collection<ReplyProductBoard> list(int pNumber) {
		return rpbd.list(pNumber);
	}

	public void insert(ReplyProductBoard rpb) {
		rpbd.insert(rpb);
	}

	public void update(ReplyProductBoard rpb) {
		rpbd.update(rpb);
	}

	public void delete(int pbrno) {
		rpbd.delete(pbrno);
		
	}

}
