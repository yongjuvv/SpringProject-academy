package com.ch.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Hashtag;
import com.ch.project.model.Movie;
import com.ch.project.model.Review;
import com.ch.project.model.Tv;
import com.ch.project.service.HashtagService;
import com.ch.project.service.MovieService;
import com.ch.project.service.ReviewService;
import com.ch.project.service.TvService;

@Controller
public class HashtagController {
	@Autowired
	private HashtagService hs;
	@Autowired
	private ReviewService rs;
	@Autowired
	private MovieService ms;
	@Autowired
	private TvService ts;

	@RequestMapping("hashtagResult")
	public String hashtagResult(int hashNum, Movie movie, Tv tv, Hashtag hashtag, Model model) {
		
		Hashtag hashtag1 = hs.select(hashNum);
		List<Review> hashMoList = rs.hashMoList(hashNum);
		List<Review> hashTvList = rs.hashTvList(hashNum);
		hs.updateClickCount(hashNum);
		
		List<Hashtag> recomHashList = hs.recomHashList();
		List<Movie> recomMovList = ms.recomMovList(movie);
		List<Tv> recomTvList = ts.recomTvList(tv);
		
		model.addAttribute("recomMovList", recomMovList);
		model.addAttribute("recomTvList", recomTvList);
		model.addAttribute("recomHashList", recomHashList);
		model.addAttribute("hashtag1", hashtag1);
		model.addAttribute("hashMoList", hashMoList);
		model.addAttribute("hashTvList", hashTvList);
		
		return "hashtag/hashtagResult";

	}
}
