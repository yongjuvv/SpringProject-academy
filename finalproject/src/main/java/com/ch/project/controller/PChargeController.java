package com.ch.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.PCharge;
import com.ch.project.service.PChargeService;
import com.ch.project.service.PMemberService;

@Controller
public class PChargeController {

	@Autowired
	private PChargeService pcs;
	@Autowired
	private PMemberService pms;

	@RequestMapping("pointPayChk")
	public String pointPayChk(HttpSession session, int pProductNum, Model model) {
		String email = (String) session.getAttribute("email");
		int result = 0;
		result = pcs.pChargeInsert(email, pProductNum);
		if (result == 1) {
			result = pms.memPointUpdate(email, pProductNum);
		}
		model.addAttribute("result", result);
		return "pointNpay/pointPayChk";
	}

	@RequestMapping("pChargeList")
	public String pChargeList(HttpSession session, String pageNum, Model model) {
		
		// 페이징1 시작
		int rowPerPage = 5;
		int pagePerBlock = 5;
		/* String pageNum = request.getParameter("pageNum"); */
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		// 페이징1 끝

		String email = (String) session.getAttribute("email");

		// 페이징2시작
		int tot = pcs.total(email);
		int total = tot - startRow + 1;
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		int totPage = (int) Math.ceil((double) tot / rowPerPage);
		if (endPage > totPage)
			endPage = totPage;
		// 페이징 끝
		List<PCharge> list = pcs.selectPChargeList(email, startRow, endRow);
		int memPoint = pms.select(email).getMemPoint();
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totPage", totPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memPoint", memPoint);

		return "pointNpay/pChargeList";
	}
}
