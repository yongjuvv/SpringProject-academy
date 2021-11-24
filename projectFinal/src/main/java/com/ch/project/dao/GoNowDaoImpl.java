package com.ch.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Pet;
import com.ch.project.model.petHealth;

@Repository
public class GoNowDaoImpl implements GoNowDao{

	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Pet> petList(String cId) {

		return sst.selectList("gonowns.petList",cId);
	}

	public petHealth select(int petNumber) {
		
		return sst.selectOne("gonowns.select",petNumber);
	}

	public Pet petSelect(String cId) {
		
		return sst.selectOne("gonowns.petSelect", cId);
	}

	

}
