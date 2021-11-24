package com.ch.project.service;

import com.ch.project.model.Pay;

public interface PayService {

	int payMovInsert(String email, int movNum);

	Pay payMovConfirm(String email, int movNum);

	Pay paytvConfirm(String email, int tvNum, int tvEpNum);

	int payTvInsert(String email, int tvNum,int tvEpNum);

}
