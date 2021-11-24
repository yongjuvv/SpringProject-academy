package com.ch.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Hashtag;
import com.ch.project.model.Movie;
import com.ch.project.model.PMember;
import com.ch.project.model.Pay;
import com.ch.project.model.Review;
import com.ch.project.model.Tv;
import com.ch.project.service.HashtagService;
import com.ch.project.service.MovieService;
import com.ch.project.service.PMemberService;
import com.ch.project.service.PayService;
import com.ch.project.service.PersonService;
import com.ch.project.service.ReviewService;
import com.ch.project.service.TvService;

@Controller
public class MovieController {
	@Autowired
	private MovieService ms;
	@Autowired
	private TvService ts;
	@Autowired
	private HashtagService hs;
	@Autowired
	private ReviewService rs;
	@Autowired
	private PersonService ps;
	@Autowired
	private PayService pas;
	@Autowired
	private PMemberService pms;

	@RequestMapping("main2")
	public String main2() {
		return "main2";
	}

	@RequestMapping("searchForm")
	public String searchForm(Hashtag hashtag, Model model) {
		List<String> nameList = new ArrayList<String>();
		List<Movie> listMovieAll = ms.listAll();
		for (Movie movie : listMovieAll) {
			nameList.add(movie.getMovName());
		}
		List<Hashtag> list = hs.list();
		int count = hs.count();
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("nameList", nameList);
		return "searchForm";
	}

	// 통합 검색 결과
	@RequestMapping("searchResult")
	public String searchResult(Movie movie, Tv tv, Model model, HttpServletRequest request) {
		String search = request.getParameter("search");
		List<Movie> movieList = ms.movieList(movie);
		List<Tv> tvList = ts.tvList(tv);
		List<Movie> recomMovList = ms.recomMovList(movie);
		List<Tv> recomTvList = ts.recomTvList(tv);
		List<Hashtag> recomHashList = hs.recomHashList();
		model.addAttribute("recomHashList", recomHashList);
		model.addAttribute("recomMovList", recomMovList);
		model.addAttribute("recomTvList", recomTvList);
		model.addAttribute("movieList", movieList);
		model.addAttribute("tvList", tvList);
		model.addAttribute("search", search);
		return "tvNmovie/searchResult";
	}

	// 영화 상세 페이지
	@RequestMapping("movSearchResult")
	public String movSearchResult(HttpSession session, int movNum,Tv tv, Model model) {

		String email = (String) session.getAttribute("email");
		int exReviewRate = 0;

		if (email != null) {

			// 내 리뷰 조회
			Review review = rs.selectMovReview(email, movNum);
			model.addAttribute("review", review);

			if (review != null) {
				// 저장된 평점 조회
				exReviewRate = review.getReviewRate();
				model.addAttribute("exReviewRate", exReviewRate);
			}

			// 영화 결제여부 조회
			Pay pay = pas.payMovConfirm(email, movNum);
			model.addAttribute("pay", pay);

			// 해시태그 전체 목록
			List<Hashtag> list = hs.allList();
			model.addAttribute("list", list);

			PMember pmember = pms.select(email);
			model.addAttribute("pmember", pmember);

			// 다른 사용자들 리뷰
			List<Review> movieReviewList = rs.movieReviewList(movNum, email);
			for (Review re : movieReviewList) {
				re.setHashName1(hs.getHashName(re.getHashNum1()));
				re.setHashName2(hs.getHashName(re.getHashNum2()));
				re.setHashName3(hs.getHashName(re.getHashNum3()));
			}
			model.addAttribute("movieReviewList", movieReviewList);
		}

		// 다른 사용자들 리뷰
		List<Review> movieReviewList = rs.movieReviewList(movNum);
		for (Review re : movieReviewList) {
			re.setHashName1(hs.getHashName(re.getHashNum1()));
			re.setHashName2(hs.getHashName(re.getHashNum2()));
			re.setHashName3(hs.getHashName(re.getHashNum3()));
		}
		model.addAttribute("movieReviewList", movieReviewList);

		Movie movie = ms.select(movNum);

		// 감독이름 배우이름 가져오기
		movie.setMovDirName(ps.getMovDirName(movie.getMovDirNum()));
		movie.setMovDirPic(ps.getActPic(movie.getMovDirNum()));
		if (movie.getActNum1() != 0) {
			movie.setActName1(ps.getActName(movie.getActNum1()));
			movie.setActPic1(ps.getActPic(movie.getActNum1()));
		}
		if (movie.getActNum2() != 0) {
			movie.setActName2(ps.getActName(movie.getActNum2()));
			movie.setActPic2(ps.getActPic(movie.getActNum2()));
		}
		if (movie.getActNum3() != 0) {
			movie.setActName3(ps.getActName(movie.getActNum3()));
			movie.setActPic3(ps.getActPic(movie.getActNum3()));
		}
		if (movie.getActNum4() != 0) {
			movie.setActName4(ps.getActName(movie.getActNum4()));
			movie.setActPic4(ps.getActPic(movie.getActNum4()));
		}
		if (movie.getActNum5() != 0) {
			movie.setActName5(ps.getActName(movie.getActNum5()));
			movie.setActPic5(ps.getActPic(movie.getActNum5()));
		}
		if (movie.getActNum6() != 0) {
			movie.setActName6(ps.getActName(movie.getActNum6()));
			movie.setActPic6(ps.getActPic(movie.getActNum6()));
		}
		if (movie.getActNum7() != 0) {
			movie.setActName7(ps.getActName(movie.getActNum7()));
			movie.setActPic7(ps.getActPic(movie.getActNum7()));
		}
		model.addAttribute("movie", movie);

		// 빈 칸을 검색하거나 DB에 없는 결과일 때
		int result = 0;
		if (movie != null) {
			result = 1;
		}
		model.addAttribute("result", result);

		// 가장 많이 선택된 해시태그 순
		List<Hashtag> hashtagList = hs.movHashtagList(movNum);
		for (Hashtag ht : hashtagList) {
			ht.setHashName(hs.getHashName(ht.getHashNum()));
		}
		model.addAttribute("hashtagList", hashtagList);
		
		List<Hashtag> recomHashList = hs.recomHashList();
		List<Movie> recomMovList = ms.recomMovList(movie);
		List<Tv> recomTvList = ts.recomTvList(tv);
		
		model.addAttribute("recomMovList", recomMovList);
		model.addAttribute("recomTvList", recomTvList);
		model.addAttribute("recomHashList", recomHashList);

		List<Review> everRateMovie = rs.everRateMovie(movNum);
		int everRateCountMovie = rs.everRateCountMovie(movNum);
		if(everRateCountMovie!=0) {
		int totRate = 0;
		for (Review review : everRateMovie) {
			int movTime = review.getReviewRate();
			totRate = totRate + movTime;
		}
			totRate = totRate / everRateCountMovie;
			model.addAttribute("totRate", totRate);
			model.addAttribute("everRateCountMovie", everRateCountMovie);
		}
		return "tvNmovie/movSearchResult";
	}

	@RequestMapping("viewMovie")
	public String viewMovie(int movNum, Model model) {
		model.addAttribute("movNum", movNum);
		return "tvNmovie/viewMovie";
	}

}
