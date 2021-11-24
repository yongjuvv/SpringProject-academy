package com.ch.project.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.CoReply;
import com.ch.project.model.Review;
import com.ch.project.service.CoReplyService;
import com.ch.project.service.ReviewService;

@Controller
public class CoReplyController {
	@Autowired
	private ReviewService rs;
	@Autowired
	private CoReplyService crs;
	
	// 댓글 목록
	@RequestMapping("reviewReplyList")
	public String reviewReplyList(HttpSession session, int reviewNum, Model model) {
		
		String email = (String) session.getAttribute("email");
		
		/* 리뷰 작성자와 댓글 작성자 간 비교를 위해 불러오기 */
		Review review = rs.select(reviewNum);
		
		/* 리뷰 번호로 댓글 리스트 불러오기 */
		Collection<CoReply> coList = crs.list(reviewNum);
		
		model.addAttribute("email", email);
		model.addAttribute("review", review);
		model.addAttribute("coList", coList);
		return "review/reviewReplyList";
	}
	
	// 댓글 등록
	@RequestMapping("reviewReplyInsert")
	public String reviewReplyInsert(HttpSession session, CoReply coreply,
			int reviewNum, Model model) {
		
		/* 세션 체크 */
		String email = (String) session.getAttribute("email");
		
		crs.insert(coreply);
		int replycount = crs.replycount(reviewNum);
		
		model.addAttribute("email", email);
		model.addAttribute("replycount", replycount);
		return "redirect:reviewReplyList.do?reviewNum="+reviewNum;
	}
	
	// 댓글 수정
	@RequestMapping("reviewReplyUpdate")
	public String reviewReplyUpdate(CoReply coreply) {
		crs.update(coreply);
		return "redirect:reviewReplyList.do?reviewNum="+coreply.getReviewNum();
	}
	
	// 댓글 삭제
	@RequestMapping("reviewReplyDelete")
	public String reviewReplyDelete(CoReply coreply) {
		crs.delete(coreply.getCoReplyNum());
		return "redirect:reviewReplyList.do?reviewNum="+coreply.getReviewNum();
	}
}
