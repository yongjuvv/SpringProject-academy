package com.ch.project.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Member;
import com.ch.project.model.ProductBoard;
import com.ch.project.model.ReplyProductBoard;
import com.ch.project.service.MypageService;
import com.ch.project.service.ReplyProductBoardService;

@Controller
public class ReplyProductBoardController {
	@Autowired
	private ReplyProductBoardService rpbs;

	@Autowired
	private MypageService ms;

	 @RequestMapping("/PBreplyList") 
	 public String replyList(int PBbno, Model model, int pNumber, HttpSession session) { 
		String cId = (String) session.getAttribute("cId");
		Member member = ms.select(cId);
		model.addAttribute("member", member);
		Collection<ReplyProductBoard> pbList = rpbs.list(pNumber);
		model.addAttribute("pbList", pbList);
	 return "order/PBreplyList"; }

	 @RequestMapping("/pbrInsert")
	 public String pbrInsert(ReplyProductBoard rpb) {
		 rpbs.insert(rpb);
		 return "redirect:/PBreplyList/pNumber"+rpb.getPNumber();
	 }
	 
	 @RequestMapping("/pbrUpdate")
	 public String pbrUpdate(ReplyProductBoard rpb) {
		 rpbs.update(rpb);
		 return "redirect:/order/PBreplyList/pNumber"+rpb.getPNumber();
	 }
	 
	 @RequestMapping("/pbrDelete")
	 public String pbrDelete(ReplyProductBoard rpb) {
		 rpbs.delete(rpb.getPbrno());
		 return "redirect:/order/PBreplyList/pNumber"+rpb.getPNumber();
	 }
	 
}
