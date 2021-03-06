package com.ch.ch10.controller;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch10.model.Board;
import com.ch.ch10.model.ReplyBoard;
import com.ch.ch10.service.BoardService;
import com.ch.ch10.service.ReplyBoardService;
@Controller
public class ReplyBoardController {
	@Autowired
	private BoardService bs;
	@Autowired
	private ReplyBoardService rbs;
	@RequestMapping("/replyList/bno/{bno}")
	public String replyList(@PathVariable int bno, Model model) {
//		System.out.println("bno = "+bno);
		Board board = bs.select(bno);
		Collection<ReplyBoard> rbdList = rbs.list(bno);
//		System.out.println("size = "+rbdList.size());
		model.addAttribute("board", board);
		model.addAttribute("rbdList", rbdList);
		return "replyList";
	}
	@RequestMapping("/rInsert")
	public String rInsert(ReplyBoard rb) {
		rbs.insert(rb);
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	@RequestMapping("/rUpdate")
	public String rUpdate(ReplyBoard rb) {
		rbs.update(rb);
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	@RequestMapping("/rDelete")
	public String rDelete(ReplyBoard rb) {
		rbs.delete(rb.getRno());
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	
	
	
	
}