package com.ch.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.PayDao;
import com.ch.project.model.Pay;

@Service
public class PayServiceImpl implements PayService{
	@Autowired
	public PayDao pd;

	@Override
	public int payMovInsert(String email, int movNum) {
		return pd.payMovInset(email,movNum);
	}

	@Override
	public Pay payMovConfirm(String email, int movNum) {
		return pd.payMovConfirm(email, movNum);
	}

	@Override
	public Pay paytvConfirm(String email, int tvNum, int tvEpNum) {
		return pd.payTvConfirm(email, tvNum,tvEpNum);
	}

	@Override
	public int payTvInsert(String email, int tvNum,int tvEpNum) {
		return pd.payTvInsert(email,tvNum,tvEpNum);
	}
}
