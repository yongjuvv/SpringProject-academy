package com.loginpro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MainController {

	@RequestMapping("/main.do")
	public String main() {
		return "redirect:/index";
	}
	@RequestMapping("location") 
	public String location() {
		return "location/location";
	}
}

