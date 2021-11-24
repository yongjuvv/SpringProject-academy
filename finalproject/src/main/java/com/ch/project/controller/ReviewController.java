package com.ch.project.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.project.model.Hashtag;
import com.ch.project.model.Like;
import com.ch.project.model.Movie;
import com.ch.project.model.PMember;
import com.ch.project.model.Review;
import com.ch.project.model.Tv;
import com.ch.project.service.CoReplyService;
import com.ch.project.service.HashtagService;
import com.ch.project.service.LikeService;
import com.ch.project.service.MovieService;
import com.ch.project.service.PChargeService;
import com.ch.project.service.PMemberService;
import com.ch.project.service.ReviewService;
import com.ch.project.service.TvService;

import pythonTest.Graph;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService rs;
	@Autowired
	private MovieService ms;
	@Autowired
	private HashtagService hs;
	@Autowired
	private PMemberService ps;
	@Autowired
	private TvService ts;
	@Autowired
	private CoReplyService cs;
	@Autowired
	private LikeService ls;
	@Autowired
	private PChargeService pcs;

	// 리뷰 평점 등록
	@RequestMapping(value = "reviewRating", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int reviewRating(HttpServletRequest request, HttpSession session, int reviewRate,
			Model model) {

		String email = (String) session.getAttribute("email");
		int tvNum = Integer.parseInt(request.getParameter("tvNum"));
		int movNum = Integer.parseInt(request.getParameter("movNum"));

		int result = 0;

		// tv 평점 등록
		if (tvNum > 0 && movNum == 0) { // tv 리뷰인 경우
			Review re = rs.selectTvReview(email, tvNum); // 리뷰(코멘트+평점)가 있는지 확인

			if (re == null) { // 리뷰가 없으면
				result = rs.tvReviewRateInsert(email, reviewRate, tvNum); // insert 쿼리 실행
				if (result == 1) { // insert 성공하면
					Review rev = rs.selectTvReview(email, tvNum); // 다시 리뷰가 있는지 확인
					result = rev.getReviewNum(); // reviewNum을 가져옴
				}
			} else { // 리뷰가 있으면
				result = rs.reviewRateUpdate(reviewRate, re.getReviewNum());// update 쿼리 실행
			}
		}

		// 영화 평점 등록
		if (movNum > 0 && tvNum == 0) { // 영화 리뷰인 경우
			Review review = rs.selectMovReview(email, movNum); // 리뷰(코멘트+평점)가 있는지 확인

			if (review == null) { // 리뷰가 없으면
				result = rs.movReviewRateInsert(email, reviewRate, movNum); // insert 쿼리 실행
				if (result == 1) { // insert 성공하면
					Review rev = rs.selectMovReview(email, movNum); // 다시 리뷰가 있는지 확인
					result = rev.getReviewNum(); // reviewNum을 가져옴
				}
			} else { // 리뷰가 있으면
				result = rs.reviewRateUpdate(reviewRate, review.getReviewNum()); // update 쿼리 실행
			}
		}

		return result;
	}

	// 코멘트 작성 폼
	@RequestMapping("commentForm")
	public String commentForm(HttpSession session, int reviewNum, Model model) {

		// 세션 체크
		String email = (String) session.getAttribute("email");

		if (email != null) {

			// 해시태그 전체 목록
			List<Hashtag> hashList = hs.allList();

			// 영화, tv 이름 가져오기
			Review review = rs.select(reviewNum);
			Movie movie = ms.select(review.getMovNum());
			Tv tv = ts.select(review.getTvNum());

			model.addAttribute("hashList", hashList);
			model.addAttribute("email", email);
			model.addAttribute("movie", movie);
			model.addAttribute("tv", tv);
			model.addAttribute("review", review);
		}

		return "review/commentForm";
	}

	// 코멘트 등록
	@RequestMapping("commentSubmit")
	public String movReviewSubmit(HttpServletRequest request, Review review, Model model) {

		// 한글 인코딩
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}

		// 해시태그
		String[] hashtags = request.getParameterValues("hashtags");
		switch (hashtags.length) {
		case 1: // 선택된 해시태그 갯수: 1개
			review.setHashNum1(Integer.parseInt(hashtags[0]));
			break;
		case 2: // 선택된 해시태그 갯수: 2개
			review.setHashNum1(Integer.parseInt(hashtags[0]));
			review.setHashNum2(Integer.parseInt(hashtags[1]));
			break;
		case 3: // 선택된 해시태그 갯수: 3개
			review.setHashNum1(Integer.parseInt(hashtags[0]));
			review.setHashNum2(Integer.parseInt(hashtags[1]));
			review.setHashNum3(Integer.parseInt(hashtags[2]));
			break;
		default:
			break;
		}

		if (review.getReviewFirstChk() == 0) { // 첫 코멘트 등록이면
			int result = 0;
			if (review.getReviewSpoiler() == null) { // 스포일러 X
				result = rs.writeCommentFirst(review);
			} else if (review.getReviewSpoiler().equals("y")) { // 스포일러 O
				result = rs.writeCommentSpoilerFirst(review);
			}
			int pProductNum = 5;
			pcs.pChargeInsert(review.getEmail(), pProductNum);
			rs.pointUp(review.getEmail()); // 포인트 지급
			model.addAttribute("result", result);
		} else { // 코멘트 재등록이면
			int result = 0;
			if (review.getReviewSpoiler() == null) { // 스포일러 X
				result = rs.writeComment(review);
			} else if (review.getReviewSpoiler().equals("y")) { // 스포일러 O
				result = rs.writeCommentSpoiler(review);
			}
			model.addAttribute("result", result);
		}
		int movNum = Integer.parseInt(request.getParameter("movNum"));
		int tvNum = Integer.parseInt(request.getParameter("tvNum"));
		model.addAttribute("movNum", movNum);
		model.addAttribute("tvNum", tvNum);

		if (tvNum == 0) { // 영화 코멘트인 경우
			return "review/movCommentSubmit";
		}
		return "review/tvCommentSubmit"; // tv 코멘트인 경우
	}

	// 내가 쓴 리뷰 목록
	@RequestMapping("myReviewList")
	public String myReviewList(HttpSession session, HttpServletRequest request, Model model) {

		// 세션 체크
		String email = (String) session.getAttribute("email");
		if (email != null) {

			// 페이징 시작
			int rowPerPage = 5;
			int pagePerBlock = 5;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals(""))
				pageNum = "1";
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = startRow + rowPerPage - 1;
			// 페이징 끝

			// 멤버 닉네임
			PMember pmember = ps.select(email);

			// 리뷰 목록
			List<Review> list2 = rs.list2(email, startRow, endRow);

			// 리뷰에 남긴 해시태그
			for (Review re : list2) {
				re.setHashName1(hs.getHashName(re.getHashNum1()));
				re.setHashName2(hs.getHashName(re.getHashNum2()));
				re.setHashName3(hs.getHashName(re.getHashNum3()));
			}

			// 페이징 시작
			int tot = rs.total(email);
			int total = tot - startRow + 1;
			int startPage = currentPage - (currentPage - 1) % pagePerBlock;
			int endPage = startPage + pagePerBlock - 1;
			int totPage = (int) Math.ceil((double) tot / rowPerPage);
			if (endPage > totPage)
				endPage = totPage;
			// 페이징 끝

			model.addAttribute("email", email);
			model.addAttribute("pmember", pmember);
			model.addAttribute("list2", list2);
			model.addAttribute("total", total);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totPage", totPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerBlock", pagePerBlock);
			model.addAttribute("pageNum", pageNum);
		}

		return "review/myReviewList";
	}

	// 코멘트 삭제 확인
	@RequestMapping("commentDeleteChk")
	public String commentDeleteChk(HttpSession session, int reviewNum, Model model) {

		// 세션 체크
		String email = (String) session.getAttribute("email");

		if (email != null) {
			model.addAttribute("reviewNum", reviewNum);
		}

		return "review/commentDeleteChk";
	}

	// 코멘트 삭제
	@RequestMapping("commentDelete")
	public String commentDelete(HttpSession session, int reviewNum, Model model) {

		// 세션 체크
		String email = (String) session.getAttribute("email");
		Review review = rs.select(reviewNum);

		if (email != null) {
			int result = rs.deleteComment(reviewNum);

			model.addAttribute("result", result);
			model.addAttribute("movNum", review.getMovNum());
			model.addAttribute("tvNum", review.getTvNum());
		}

		if (review.getTvNum() == 0) { // 영화 코멘트인 경우
			return "review/movCommentDelete";
		}

		return "review/tvCommentDelete"; // tv 코멘트인 경우
	}

	// 리뷰 상세보기
	@RequestMapping("reviewDetail")
	public String reviewDetail(HttpSession session, Model model, int reviewNum) {

		String email = (String) session.getAttribute("email");
		Review review = rs.select(reviewNum);
		double reviewRate = review.getReviewRate() * 0.5;
		int replycount = cs.replycount(reviewNum);

		model.addAttribute("review", review);
		model.addAttribute("reviewRate", reviewRate);
		model.addAttribute("replycount", replycount);

		if (email != null) {
			PMember pmember = ps.select(email);
			model.addAttribute("pmember", pmember);

			Like like = ls.select(reviewNum, email);
			model.addAttribute("like", like);
		}

		return "review/reviewDetail";
	}

	@RequestMapping("viewMoreMovReview")
	public String viewMoreMovReview(HttpSession session, int movNum, Model model) {

		String email = (String) session.getAttribute("email");

		if (email != null) {
			List<Review> movieReviewList = rs.movieReviewList(movNum, email);
			for (Review re : movieReviewList) {
				re.setHashName1(hs.getHashName(re.getHashNum1()));
				re.setHashName2(hs.getHashName(re.getHashNum2()));
				re.setHashName3(hs.getHashName(re.getHashNum3()));
			}
			model.addAttribute("movieReviewList", movieReviewList);

		} else {
			List<Review> movieReviewList = rs.movieReviewList(movNum);
			for (Review re : movieReviewList) {
				re.setHashName1(hs.getHashName(re.getHashNum1()));
				re.setHashName2(hs.getHashName(re.getHashNum2()));
				re.setHashName3(hs.getHashName(re.getHashNum3()));
			}
			model.addAttribute("movieReviewList", movieReviewList);
		}
		return "review/viewMoreMovReview";
	}

	@RequestMapping("viewMoreTvReview")
	public String viewMoreTvReview(HttpSession session, int tvNum, Model model) {

		String email = (String) session.getAttribute("email");

		if (email != null) {
			List<Review> tvReviewList = rs.tvReviewList(tvNum, email);
			for (Review re : tvReviewList) {
				re.setHashName1(hs.getHashName(re.getHashNum1()));
				re.setHashName2(hs.getHashName(re.getHashNum2()));
				re.setHashName3(hs.getHashName(re.getHashNum3()));
			}
			model.addAttribute("tvReviewList", tvReviewList);

		} else {
			List<Review> tvReviewList = rs.tvReviewList(tvNum);
			for (Review re : tvReviewList) {
				re.setHashName1(hs.getHashName(re.getHashNum1()));
				re.setHashName2(hs.getHashName(re.getHashNum2()));
				re.setHashName3(hs.getHashName(re.getHashNum3()));
			}
			model.addAttribute("tvReviewList", tvReviewList);
		}

		return "review/viewMoreTvReview";
	}

	@RequestMapping("myHashtag")
	public String myHashtag(HttpSession session, Model model, Review review) {
		String email = (String) session.getAttribute("email");
		if (email != null) {
			int preRevieCount = rs.preReviewCount(email);// 내가 남긴 리뷰 수
			PMember pmember = ps.select(email);
			int sum = hs.sum(email);
			int totHash = hs.count();
			if (totHash != 0) {
				int c1 = (int) 10000 * sum / totHash;
				double preHashPercent = (double) c1 / 100; // 내가 남긴 해시태그 비율
				model.addAttribute("preHashPercent", preHashPercent);
			}
			List<Review> preGenre = rs.preGenre(email); // 내가 많이 본 장르
			List<Movie> preAct = ms.preAct(email);
			List<Movie> preDic = ms.preDic(email);
			List<Movie> timeSum = ms.timeSum(email);
			int totTime = 0;
			for (Movie mov : timeSum) {
				int movTime = mov.getMovTime();
				totTime = totTime + movTime;
			}
			if (totTime > 60) {
				totTime = totTime / 60;
			}
			int countMovie = rs.countMovie(email);
			model.addAttribute("countMovie", countMovie);

			int countTv = rs.countTv(email);
			model.addAttribute("countTv", countTv);
			
			double rateAvg = rs.rateAvg(email);
			int rateCnt = rs.rateCnt(email);
			double mostRating = rs.mostRating(email);
			
			Graph gh = new Graph();
			gh.rating(email);
			gh.wordcloud(email);
			
			model.addAttribute("rateAvg",rateAvg);
			model.addAttribute("rateCnt",rateCnt);
			model.addAttribute("mostRating", mostRating);
			model.addAttribute("preRevieCount", preRevieCount);
			model.addAttribute("pmember", pmember);
			model.addAttribute("preGenre", preGenre);
			model.addAttribute("preAct", preAct);
			model.addAttribute("preDic", preDic);
			model.addAttribute("totTime", totTime);
			model.addAttribute("timeSum", timeSum);
		}

		return "member/myHashtag";
	}
}
