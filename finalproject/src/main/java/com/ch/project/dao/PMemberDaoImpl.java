package com.ch.project.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.PMember;

@Repository
public class PMemberDaoImpl implements PMemberDao {

	@Autowired
	private SqlSessionTemplate sst;

	public int insert(PMember pmember) {
		return sst.insert("pmemberns.insert", pmember);
	}

	@Override
	public int eamilChk(String email) {
		return sst.selectOne("pmemberns.emailChk", email);
	}

	@Override
	public PMember select(String email) {
		return sst.selectOne("pmemberns.select", email);
	}

	@Override
	public int delete(String email) {
		return sst.update("pmemberns.delete", email);
	}

	@Override
	public int update(PMember pmember) {
		return sst.update("pmemberns.update", pmember);
	}

	@Override
	public int memPointUpdate(String email, int pProductNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("pProductNum", pProductNum);
		return sst.update("pmemberns.memPointUpdate", hm);
	}

	@Override
	public int memPointUpdate2(String email, int movNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("movNum", movNum);
		return sst.update("pmemberns.memPointUpdate2", hm);
	}

	@Override
	public int passUpdate(String email, String pass2) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("pass2", pass2);
		return sst.update("pmemberns.passUpdate", hm);
	}

	@Override
	public int memPointUpdate3(String email, int tvNum, int tvEpNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("tvNum", tvNum);
		hm.put("tvEpNum", tvEpNum);
		return sst.update("pmemberns.memPointUpdate3", hm);
	}

}
