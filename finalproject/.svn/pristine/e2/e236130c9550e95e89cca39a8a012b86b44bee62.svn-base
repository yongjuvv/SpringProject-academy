package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.PChargeDao;
import com.ch.project.model.PCharge;

@Service
public class PChargeServiceImpl implements PChargeService {

	@Autowired
	public PChargeDao pcd;

	@Override
	public int pChargeInsert(String email, int pProductNum) {
		return pcd.pChargeInsert(email,pProductNum);
	}

	@Override
	public List<PCharge> selectPChargeList(String email, int startRow, int endRow) {
		return pcd.selectPChargeList(email,startRow, endRow);
	}

	@Override
	public int total(String email) {
		return pcd.total(email);
	}

}
