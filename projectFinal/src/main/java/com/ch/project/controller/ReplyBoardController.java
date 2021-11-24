package com.ch.project.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.project.model.pj_Board;
import com.ch.project.model.Member;
import com.ch.project.model.ReplyBoard;
import com.ch.project.service.BoardService;
import com.ch.project.service.MypageService;
import com.ch.project.service.ReplyBoardService;
@Controller

public class ReplyBoardController {
	@Autowired
	private BoardService bs;
	@Autowired
	private ReplyBoardService rbs;
	@Autowired
	private MypageService ms;
	
	@RequestMapping("rbdList")
	public String rbdList(int b_num, Model model, Member member, ReplyBoard rb, HttpSession session) {
		pj_Board pj_board= bs.boardSelect(b_num);
		List<ReplyBoard> rbdList = rbs.rbdList(b_num);
		System.out.println("size="+rbdList.size());
		String id = (String) session.getAttribute("cId");
		member = ms.select(id);
		model.addAttribute("member", member);
		model.addAttribute("rbdList", rbdList);
		model.addAttribute("pj_board", pj_board);
		return "pj_Board/rbdList";
	}
	///////////////////////////////////////////
	@RequestMapping("/rDelete") 
	public String rDelete(ReplyBoard rb) {
		rbs.rDelete(rb);
		return "redirect:/rbdList.do?b_num="+rb.getB_num();
	}
	@RequestMapping("/rUpdate")
	public String rUpdate(ReplyBoard rb) {
		rbs.rUpdate(rb);
		return "redirect:/rbdList.do?b_num="+rb.getB_num();
	}
	@RequestMapping("/rInsert")
	public String rInsert(int b_num, ReplyBoard rb, Model model, HttpSession session) {
		rbs.rInsert(rb);
		String cId = (String) session.getAttribute("cId");
	    Member member = ms.select(cId);
		// redirect/forward는 JSP로 가지 않고 다시 콘트롤러에서 찾는다
		return "redirect:/rbdList.do?b_num="+rb.getB_num();
	}
}