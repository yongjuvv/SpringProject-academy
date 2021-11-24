package com.ch.project.service;

import java.util.Collection;

import com.ch.project.model.ReplyProductBoard;

public interface ReplyProductBoardService {

	Collection<ReplyProductBoard> list(int pNumber);

	void insert(ReplyProductBoard rpb);

	void update(ReplyProductBoard rpb);

	void delete(int pbrno);


}
