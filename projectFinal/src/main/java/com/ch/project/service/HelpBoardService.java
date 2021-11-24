package com.ch.project.service;

import java.util.List;

import com.ch.project.model.HelpBoard;

public interface HelpBoardService {

	int getTotal(HelpBoard board);

	List<HelpBoard> list(HelpBoard board);

	HelpBoard select(int num);

	int maxNum();

	int insert(HelpBoard board);

	void updateStep(HelpBoard board);

	int update(HelpBoard board);

	void updateReadCount(int num);

	int delete(int num);

}
