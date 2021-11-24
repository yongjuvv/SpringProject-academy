package com.ch.project.dao;

import com.ch.project.model.Pay;

public interface PayDao {

	int payMovInset(String email, int movNum);

	Pay payMovConfirm(String email, int movNum);

	Pay payTvConfirm(String email, int tvNum, int tvEpNum);

	int payTvInsert(String email, int tvNum, int tvEpNum);


}
