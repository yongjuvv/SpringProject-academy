package com.ch.project.dao;

import java.util.Collection;

import com.ch.project.model.CoReply;

public interface CoReplyDao {

	Collection<CoReply> list(int reviewNum);

	void insert(CoReply coreply);

	void delete(int coReplyNum);

	void update(CoReply coreply);

	int replycount(int reviewNum);

}
