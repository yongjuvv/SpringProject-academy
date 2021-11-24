package com.ch.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Pet;
import com.ch.project.model.petHealth;
import com.ch.project.service.GoNowService;

@Controller
public class GoNowController {

	@Autowired
	private GoNowService gs;
	
	@RequestMapping("gonow")
	public String gonow() {
		return "gonow";
				
	}
	@RequestMapping("myPetList")
	public String petHealthInfo(Pet pet, Model model, HttpSession session) {
		String cId = (String) session.getAttribute("cId");
		List<Pet> petList = gs.petList(cId);
		
		model.addAttribute("petList",petList);
		return "myPetList";
	}
	
	@RequestMapping("petInfo")
	public String petInfo(Model model, petHealth petHealth,HttpSession session, Pet pet) {
		System.out.println("num="+petHealth.getPetNumber());
		petHealth = gs.select(petHealth.getPetNumber());
		System.out.println("pet="+petHealth);
		model.addAttribute("petHealth", petHealth);
		/*
		 * String cId = (String) session.getAttribute("cId"); pet = gs.petSelect(cId);
		 * petHealth petHealth = gs.select(pet.getPetNumber());
		 * model.addAttribute(petHealth);
		 */
		return "petInfo";
	}
		
		
	
}
