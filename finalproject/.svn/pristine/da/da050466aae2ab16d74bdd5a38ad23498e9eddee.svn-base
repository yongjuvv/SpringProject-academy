package com.ch.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.PCharge;

@Repository
public class PChargeDaoImpl implements PChargeDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int pChargeInsert(String email, int pProductNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("pProductNum", pProductNum);
		return sst.insert("pchargens.pChargeInsert", hm);
	}

	@Override
	public List<PCharge> selectPChargeList(String email, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);	
		return sst.selectList("pchargens.selectPChargeList",hm);
	}

	@Override
	public int total(String email) {
		return sst.selectOne("pchargens.total",email);
	}
	
}
