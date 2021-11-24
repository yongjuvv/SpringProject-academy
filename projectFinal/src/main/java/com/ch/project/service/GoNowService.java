package com.ch.project.service;

import java.util.List;

import com.ch.project.model.Pet;
import com.ch.project.model.petHealth;

public interface GoNowService {

	List<Pet> petList(String cId);

	petHealth select(int petNumber);

	Pet petSelect(String cId);




}
