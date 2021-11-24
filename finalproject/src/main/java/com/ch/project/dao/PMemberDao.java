package com.ch.project.dao;

import com.ch.project.model.PMember;

public interface PMemberDao {
	int insert(PMember pmember);

	int eamilChk(String email);

	PMember select(String email);

	int delete(String email);

	int update(PMember pmember);

	int memPointUpdate(String email, int pProductNum);

	int memPointUpdate2(String email, int movNum);

	int passUpdate(String email, String pass2);

	int memPointUpdate3(String email, int tvNum, int tvEpNum);

}
