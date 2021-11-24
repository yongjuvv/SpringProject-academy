package com.ch.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.PMemberDao;
import com.ch.project.model.PMember;

@Service
public class PMemberServiceImpl implements PMemberService {

	@Autowired
	private PMemberDao pd;

	public int insert(PMember pmember) {
		return pd.insert(pmember);
	}

	@Override
	public int emailChk(String email) {
		return pd.eamilChk(email);
	}

	@Override
	public PMember select(String email) {
		return pd.select(email);
	}

	@Override
	public int delete(String email) {
		return pd.delete(email);
	}

	@Override
	public int update(PMember pmember) {
		return pd.update(pmember);
	}

	@Override
	public int memPointUpdate(String email, int pProductNum) {
		return pd.memPointUpdate(email, pProductNum);
	}

	@Override
	public int memPointUpdate2(String email, int movNum) {
		return pd.memPointUpdate2(email, movNum);
	}

	@Override
	public int passUpdate(String email, String pass2) {
		return pd.passUpdate(email, pass2);
	}

	@Override
	public int memPointUpdate3(String email, int tvNum, int tvEpNum) {
		return pd.memPointUpdate3(email, tvNum, tvEpNum);
	}

}
