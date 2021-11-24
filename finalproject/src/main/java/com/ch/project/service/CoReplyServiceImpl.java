package com.ch.project.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.CoReplyDao;
import com.ch.project.model.CoReply;

@Service
public class CoReplyServiceImpl implements CoReplyService {
	
	@Autowired
	private CoReplyDao cd;

	@Override
	public Collection<CoReply> list(int reviewNum) {
		return cd.list(reviewNum);
	}

	@Override
	public void insert(CoReply coreply) {
		cd.insert(coreply);
	}

	@Override
	public void delete(int coReplyNum) {
		cd.delete(coReplyNum);
	}

	@Override
	public void update(CoReply coreply) {
		cd.update(coreply);
	}

	@Override
	public int replycount(int reviewNum) {
		return cd.replycount(reviewNum);
	}

}
