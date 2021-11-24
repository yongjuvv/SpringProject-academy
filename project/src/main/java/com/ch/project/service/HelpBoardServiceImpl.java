package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.HelpBoardDao;
import com.ch.project.model.HelpBoard;
@Service
public class HelpBoardServiceImpl implements HelpBoardService{
	@Autowired
	private HelpBoardDao hd;
	
	public int getTotal(HelpBoard board) {
		return hd.getTotal(board);
	}
	public List<HelpBoard> list(HelpBoard board) {
		return hd.list(board);
	}
	@Override
	public HelpBoard select(int num) {
		return hd.select(num);
	}
	@Override
	public int maxNum() {
		return hd.maxNum();
	}
	@Override
	public int insert(HelpBoard board) {
		return hd.insert(board);
	}
	@Override
	public void updateStep(HelpBoard board) {
		hd.updateStep(board);
		
	}
	@Override
	public int update(HelpBoard board) {
		return hd.update(board);
	}
	@Override
	public void updateReadCount(int num) {
		hd.updateReadCount(num);
	}
	@Override
	public int delete(int num) {
		return hd.delete(num);
	}

}
