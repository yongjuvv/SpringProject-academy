package com.ch.project.dao;

import java.util.List;

import com.ch.project.model.PCharge;

public interface PChargeDao {

	int pChargeInsert(String email, int pProductNum);

	List<PCharge> selectPChargeList(String email, int startRow, int endRow);

	int total(String email);

}
