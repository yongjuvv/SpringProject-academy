package com.ch.project.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.BankList;
import com.ch.project.model.PMember;
import com.ch.project.model.PProduct;
import com.ch.project.service.BankListService;
import com.ch.project.service.PMemberService;
import com.ch.project.service.PProductService;

@Controller
public class PProductController {
	@Autowired
	private PProductService pds;
	@Autowired
	private PMemberService pms;
	@Autowired
	private BankListService bls;

	@RequestMapping("pChargeDetail")
	public String pChargeDetail(HttpSession session, int pProductNum, Model model) {
		String email = (String) session.getAttribute("email");
		PMember pmember = pms.select(email);
		PProduct pproduct = pds.select(pProductNum);
		int balance = pmember.getMemPoint() + pproduct.getpProductPoint();
		Collection<BankList> bankList = bls.list();
		model.addAttribute("pproduct", pproduct);
		model.addAttribute("pmember", pmember);
		model.addAttribute("balance", balance);
		model.addAttribute("bankList", bankList);
		return "pointNpay/pChargeDetail";
	}
}
