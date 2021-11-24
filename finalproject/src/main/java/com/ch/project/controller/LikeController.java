package com.ch.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Review;
import com.ch.project.service.LikeService;
import com.ch.project.service.ReviewService;

@Controller
public class LikeController {

	@Autowired
	private LikeService ls;
	@Autowired
	private ReviewService rs;

	// 리뷰 좋아요 기능
	@RequestMapping("reviewLike")
	public String reviewLike (int reviewNum, HttpSession session, Model model) {
		
		String email = (String) session.getAttribute("email");
		int result = ls.countLikeChk(reviewNum, email); // [like1] 데이터 존재 여부 조회
		
		if (result == 0) { // [like1] 데이터 없으면
			ls.insertData(reviewNum, email); // [like1] insert data
			ls.insertLike(reviewNum, email); // [like1] update likeChk=1
			rs.likeUp(reviewNum); // [review1] 좋아요 +1
			Review review = rs.select(reviewNum);
			model.addAttribute("likeCount", review.getReviewLike()); // count 갯수를 보냄
		} else {
			ls.deleteLike(reviewNum, email); // [like1] delete
			rs.likeDown(reviewNum); // [review1] 좋아요 -1
			Review review = rs.select(reviewNum);
			model.addAttribute("likeCount", review.getReviewLike()); // count 갯수를 보냄
		}

		return "review/reviewLike";
	}

}
