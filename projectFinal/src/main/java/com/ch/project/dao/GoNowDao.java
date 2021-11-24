package com.ch.project.dao;

import java.util.List;

import com.ch.project.model.Pet;
import com.ch.project.model.petHealth;

public interface GoNowDao {

	List<Pet> petList(String cId);

	petHealth select(int petNumber);

	Pet petSelect(String cId);



}
