package com.ch.project.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Pay;

@Repository
public class PayDaoImpl implements PayDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int payMovInset(String email, int movNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email",email);
		hm.put("movNum",movNum);
		return sst.insert("payns.payMovInsert",hm);
	}

	@Override
	public Pay payMovConfirm(String email, int movNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email",email);
		hm.put("movNum",movNum);
		return sst.selectOne("payns.payMovConfirm",hm);
	}

	@Override
	public Pay payTvConfirm(String email, int tvNum, int tvEpNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email",email);
		hm.put("tvNum",tvNum);
		hm.put("tvEpNum", tvEpNum);
		return sst.selectOne("payns.payTvConfirm",hm);
	}

	@Override
	public int payTvInsert(String email, int tvNum, int tvEpNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email",email);
		hm.put("tvNum",tvNum);
		hm.put("tvEpNum",tvEpNum);
		return sst.insert("payns.payTvInsert",hm);
	}

}
