package com.ch.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.project.model.Member;
import com.ch.project.model.ProductBoard;
import com.ch.project.service.MypageService;
import com.ch.project.service.ProductBoardService;

@Controller
public class ProductBoardController {
	@Autowired
	private ProductBoardService pbs;
	
	@Autowired
	private MypageService ms;
	
	@RequestMapping("PBview")
	public String PBview(Model model, HttpSession session) {
		String cId = (String) session.getAttribute("cId"); //세션에 id 저장
		Member member = ms.select(cId); //member db에 있는 id 선택
		model.addAttribute("member", member);
		return "PBview";
	}
	
	@RequestMapping("PBview2")
	public String PBview2(Model model, HttpSession session) {
		model.addAttribute("model", model);
		return "PBview2";
	}
	

}
