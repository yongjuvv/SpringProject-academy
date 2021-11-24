package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.GoNowDao;
import com.ch.project.model.Pet;
import com.ch.project.model.petHealth;

@Service
public class GoNowServiceImpl implements GoNowService{

	@Autowired
	private GoNowDao gd;

	public List<Pet> petList(String cId) {
		
		return gd.petList(cId);
	}


	public petHealth select(int petNumber) {
		
		return gd.select(petNumber);
	}


	public Pet petSelect(String cId) {
		
		return gd.petSelect(cId);
	}



	




	
}
