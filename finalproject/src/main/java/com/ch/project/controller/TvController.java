package com.ch.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Hashtag;
import com.ch.project.model.PMember;
import com.ch.project.model.Review;
import com.ch.project.model.Tv;
import com.ch.project.model.TvEp;
import com.ch.project.service.HashtagService;
import com.ch.project.service.PMemberService;
import com.ch.project.service.PersonService;
import com.ch.project.service.ReviewService;
import com.ch.project.service.TvEpService;
import com.ch.project.service.TvService;

@Controller
public class TvController {
	@Autowired
	private TvService ts;
	@Autowired
	private ReviewService rs;
	@Autowired
	private PersonService ps;
	@Autowired
	private HashtagService hs;
	@Autowired
	private TvEpService tes;
	@Autowired
	private PMemberService pms;

	// tv 상세 페이지
	@RequestMapping("tvSearchResult")
	public String tvSearchResult(HttpSession session, int tvNum, Model model) {

		String email = (String) session.getAttribute("email");
		int exReviewRate = 0;

		if (email != null) {

			// tv 리뷰 조회
			Review review = rs.selectTvReview(email, tvNum);
			model.addAttribute("review", review);

			// email과 review가 있는 경우만 조회 가능한 항목
			if (review != null) {
				// 저장된 평점 조회
				exReviewRate = review.getReviewRate();
				model.addAttribute("exReviewRate", exReviewRate);
			}

			// 해시태그 전체 목록
			List<Hashtag> list = hs.allList();
			model.addAttribute("list", list);

			PMember pmember = pms.select(email);
			model.addAttribute("pmember", pmember);

			// 다른 사용자들 리뷰
			List<Review> tvReviewList = rs.tvReviewList(tvNum, email);
			for (Review re : tvReviewList) {
				re.setHashName1(hs.getHashName(re.getHashNum1()));
				re.setHashName2(hs.getHashName(re.getHashNum2()));
				re.setHashName3(hs.getHashName(re.getHashNum3()));
			}
			model.addAttribute("tvReviewList", tvReviewList);
		}

		// 다른 사용자들 리뷰
		List<Review> tvReviewList = rs.tvReviewList(tvNum);
		for (Review re : tvReviewList) {
			re.setHashName1(hs.getHashName(re.getHashNum1()));
			re.setHashName2(hs.getHashName(re.getHashNum2()));
			re.setHashName3(hs.getHashName(re.getHashNum3()));
		}
		model.addAttribute("tvReviewList", tvReviewList);

		// epList 가져오기
		List<TvEp> tvEpList = tes.tvEpList(tvNum);
		model.addAttribute("tvEpList", tvEpList);

		Tv tv = ts.select(tvNum);
		model.addAttribute("tv", tv);

		// 감독이름 배우이름 가져오기
		tv.setTvDirName(ps.getTvDirName(tv.getTvDirNum()));
		if (tv.getActNum1() != 0) {
			tv.setActName1(ps.getActName(tv.getActNum1()));
			tv.setActPic1(ps.getActPic(tv.getActNum1()));
		}
		if (tv.getActNum2() != 0) {
			tv.setActName2(ps.getActName(tv.getActNum2()));
			tv.setActPic2(ps.getActPic(tv.getActNum2()));
		}
		if (tv.getActNum3() != 0) {
			tv.setActName3(ps.getActName(tv.getActNum3()));
			tv.setActPic3(ps.getActPic(tv.getActNum3()));
		}
		if (tv.getActNum4() != 0) {
			tv.setActName4(ps.getActName(tv.getActNum4()));
			tv.setActPic4(ps.getActPic(tv.getActNum4()));
		}
		if (tv.getActNum5() != 0) {
			tv.setActName5(ps.getActName(tv.getActNum5()));
			tv.setActPic5(ps.getActPic(tv.getActNum5()));
		}
		if (tv.getActNum6() != 0) {
			tv.setActName6(ps.getActName(tv.getActNum6()));
			tv.setActPic6(ps.getActPic(tv.getActNum6()));
		}
		if (tv.getActNum7() != 0) {
			tv.setActName7(ps.getActName(tv.getActNum7()));
			tv.setActPic7(ps.getActPic(tv.getActNum7()));
		}

		// 빈 칸을 검색하거나 DB에 없는 결과일 때
		int result = 0;
		if (tv != null)
			result = 1;
		model.addAttribute("result", result);

		// 가장 많이 선택된 해시태그 순
		List<Hashtag> hashtagList = hs.tvHashtagList(tvNum);
		for (Hashtag ht : hashtagList) {
			ht.setHashName(hs.getHashName(ht.getHashNum()));
		}
		model.addAttribute("hashtagList", hashtagList);

		List<Review> everRateTv = rs.everRateTv(tvNum);
		int everRateCountTv = rs.everRateCountTv(tvNum);
		if(everRateCountTv!=0) {
		int totRate = 0;
		for (Review review : everRateTv) {
			int movTime = review.getReviewRate();
			totRate = totRate + movTime;
		}
			totRate = totRate / everRateCountTv;
			model.addAttribute("totRate", totRate);
			model.addAttribute("everRateCountTv", everRateCountTv);
		}
		return "tvNmovie/tvSearchResult";
	}

	@RequestMapping("viewTv")
	public String tvPayForm(int tvNum, int tvEpNum, Model model) {
		Tv tv = ts.select(tvNum);
		TvEp tvEp = tes.select(tvNum, tvEpNum);
		model.addAttribute("tv", tv);
		model.addAttribute("tvEp", tvEp);
		return "tvNmovie/viewTv";
	}
}
