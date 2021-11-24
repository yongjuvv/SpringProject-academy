package com.loginpro.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loginpro.model.Member;
import com.loginpro.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService ls;
	
	@RequestMapping("join")
	public String join(Member member, Model model, HttpSession session) {
		int result = 0 ;
		System.out.println("email = "+member.getEmail());
		Member mem = ls.select(member.getId());
		if(mem == null || mem.getDel().equals("y")) {
			result = -1;
		}else if(member.getPassward().equals(mem.getPassward())) {
			result = 1;
			session.setAttribute("cId", member.getId());
		}
		model.addAttribute("result", result);
		
		return "login/login";
		
	}
}
