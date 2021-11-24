package com.ch.project.service;

import java.util.List;

import com.ch.project.model.PCharge;

public interface PChargeService {

	int pChargeInsert(String email, int pProductNum);

	List<PCharge> selectPChargeList(String email, int startRow, int endRow);

	int total(String email);



}
