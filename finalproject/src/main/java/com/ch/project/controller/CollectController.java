package com.ch.project.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Cart;
import com.ch.project.model.CoReply;
import com.ch.project.model.CollVideo;
import com.ch.project.model.Collect;
import com.ch.project.model.Hashtag;
import com.ch.project.model.Movie;
import com.ch.project.model.PMember;
import com.ch.project.model.Review;
import com.ch.project.model.Tv;
import com.ch.project.service.CollVideoService;
import com.ch.project.service.CollectService;
import com.ch.project.service.HashtagService;
import com.ch.project.service.MovieService;
import com.ch.project.service.PMemberService;
import com.ch.project.service.ReviewService;
import com.ch.project.service.TvService;

@Controller
public class CollectController {
	@Autowired
	private HashtagService hs;
	@Autowired
	private ReviewService rs;
	@Autowired
	private MovieService ms;
	@Autowired
	private TvService ts;
	@Autowired
	private CollectService cs;
	@Autowired
	private PMemberService ps;
	@Autowired
	private CollVideoService cvs;
	@RequestMapping("myCollectionList")
	public String myCollectionList(HttpSession session,HttpServletRequest request,  Model model) {
		String email = (String)session.getAttribute("email");
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
			
			// 콜렉션 목록
			List<Collect> collectList = cs.collectList(email, startRow, endRow);
			
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
			model.addAttribute("collectList", collectList);
			model.addAttribute("total", total);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totPage", totPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerBlock", pagePerBlock);
			model.addAttribute("pageNum", pageNum);
		}
		
		return "collection/myCollectionList";
	}
	@RequestMapping("newCollection")
	public String newCollection(HttpSession session, Model model) {
		String email = (String)session.getAttribute("email");
		int result = cs.deleteCart(email);
		model.addAttribute("email", email);
		model.addAttribute("result", result);
		return "collection/newCollection";
	}
	@RequestMapping("list")
	public String list(String searchCollect, Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");
		List<Movie> searchMovieList = ms.searchMovieList(searchCollect);
		List<Tv> searchTvList = ts.searchTvList(searchCollect);
		
		model.addAttribute("searchMovieList", searchMovieList);
		model.addAttribute("searchTvList", searchTvList);
		model.addAttribute("email", email);
		return "collection/list";	
	}
	@RequestMapping("searchCollect1")
	public String searchCollect1() {
		return "collection/searchCollect1";
	}
	@RequestMapping("addToCart")
	public String addCollect(int movNum, int tvNum, Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");
		int result = cs.insertCollect(movNum, tvNum, email);
		Movie movie = ms.select(movNum);
		model.addAttribute("result", result);
		model.addAttribute("movie", movie);
		return "collection/addToCart";
	}
	@RequestMapping("cartList")
	public String cartList(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		List<Cart> cartList = cs.cartList(email);
		model.addAttribute("email", email);
		model.addAttribute("cartList", cartList);
		return "collection/cartList";
	}
	@RequestMapping("myHashTag")
	public String preference(HttpSession session, Model model,Review review) {
		String email = (String) session.getAttribute("email");
		if(email != null) {
			int preRevieCount = rs.preReviewCount(email);// 내가 남긴 리뷰 수
			PMember pmember = ps.select(email);
			int sum = hs.sum(email); 
			int totHash = hs.count();
			int c1 = (int) 10000*sum /totHash; 
			double preHashPercent = (double) c1 / 100; // 내가 남긴 해시태그 비율
			List<Review> preGenre = rs.preGenre(email);  // 내가 많이 본 장르
			List<Movie> preAct = ms.preAct(email);
			List<Movie> preDic = ms.preDic(email);
			List<Movie> timeSum = ms.timeSum(email);
			int totTime = 0;
			for(Movie  mov  : timeSum){
				int movTime = mov.getMovTime();
				totTime = totTime + movTime;
				}
			totTime = totTime/60;
			
			int countMovie = rs.countMovie(email);
			model.addAttribute("countMovie", countMovie);
			
			int countTv = rs.countTv(email);
			model.addAttribute("countTv", countTv);
			
			
			model.addAttribute("preRevieCount",preRevieCount);
			model.addAttribute("pmember",pmember);
			model.addAttribute("preHashPercent",preHashPercent);
			model.addAttribute("preGenre",preGenre);
			model.addAttribute("preAct",preAct);
			model.addAttribute("preDic",preDic);
			model.addAttribute("totTime",totTime);
			model.addAttribute("timeSum",timeSum);
		}
		return "member/myHashTag";
	
	}
	@RequestMapping("submitCollect")
	public String submitCollect(String email, String collName, String collDesc, Model model) {
		Collect collect = new Collect();
		collect.setEmail(email);
		collect.setCollName(collName);
		collect.setCollDesc(collDesc);
		
		int result = cs.insertCollectToCollection(collect);
		int collNum = collect.getCollNum();
		int result1 = cs.insertCollVid(email, collNum);
		System.out.println("result1="+result1);
		int result2 = 0;
		if (result1>0) result2 = cs.deleteCart(email);
		
		System.out.println("result2="+result2);
		model.addAttribute("result", result);
		model.addAttribute("result1", result1);
		return "collection/submitCollect";
	}
	@RequestMapping("myCollectListDetail")
	public String myCollectListDetail(int collNum, HttpSession session,  Model model) {
		String email = (String) session.getAttribute("email");
		
		if (email != null) {
			Collect collect = cs.selectCollect(collNum);
			PMember pmember = ps.select(email);
			model.addAttribute("pmember", pmember);
			model.addAttribute("collect", collect);
		}
		List<CollVideo> CollVideoList = cvs.CollVideoList(collNum);
		
		model.addAttribute("CollVideoList", CollVideoList);

		return "collection/myCollectListDetail";
	}
}
