package com.ch.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.HelpBoard;
import com.ch.project.model.Member;
import com.ch.project.service.HelpBoardService;
import com.ch.project.service.LoginService;
import com.ch.project.service.MypageService;
import com.ch.project.service.PagingBean;

@Controller
public class mainController {

   @Autowired	
	private LoginService ls;
   
   @Autowired
   private MypageService ms;
	
	@RequestMapping("main")
	public String main() {
		return "main";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login/logout";
	}
	@RequestMapping("mypage")
	public String mypage() {
		return "mypage";
	}

   
   @Autowired
   private HelpBoardService hs;
   
	/*
	 * @RequestMapping("helplist") public String helplist() { return "helplist"; }
	 */
   @RequestMapping("helplist1")
   public String list1(HelpBoard board, String pageNum, Model model, Member member, HttpSession session) {
	   if(pageNum == null || pageNum.equals("")) pageNum="1";
	   int total = hs.getTotal(board);
	   int currentPage = Integer.parseInt(pageNum);
	   int rowPerPage = 10;
	   int startRow = (currentPage - 1) * rowPerPage + 1;
	   int endRow = startRow + rowPerPage -1;
	   String id = (String) session.getAttribute("cId");
	   member = ms.select(id);
	   PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
	   board.setStartRow(startRow);
	   board.setEndRow(endRow);
	   String[] tit = {"작성자", "제목", "내용", "제목 + 내용"};
	   List<HelpBoard> list = hs.list(board);
	   model.addAttribute("member", member);
	   model.addAttribute("list", list);
	   model.addAttribute("tit", tit);
	   model.addAttribute("pb", pb);
	   model.addAttribute("pageNum", pageNum);
	   return "helpBoard/helplist1";
   }
   @RequestMapping("helplist")
   public String list(HelpBoard board, String pageNum, Model model, Member member, HttpSession session) {
	   if(pageNum == null || pageNum.equals("")) pageNum="1";
	   int total = hs.getTotal(board);
	   int currentPage = Integer.parseInt(pageNum);
	   int rowPerPage = 10;
	   int startRow = (currentPage - 1) * rowPerPage + 1;
	   int endRow = startRow + rowPerPage -1;
	   String id = (String) session.getAttribute("cId");
	   member = ms.select(id);
	   PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
	   board.setStartRow(startRow);
	   board.setEndRow(endRow);
	   String[] tit = {"작성자", "제목", "내용", "제목 + 내용"};
	   List<HelpBoard> list = hs.list(board);
	   model.addAttribute("member", member);
	   model.addAttribute("list", list);
	   model.addAttribute("tit", tit);
	   model.addAttribute("pb", pb);
	   model.addAttribute("pageNum", pageNum);
	   return "helplist";
   }
   @RequestMapping("helpInsertForm")
	public String insertForm(String nm, String pageNum, Model model, HttpSession session) {
		int hb_ref=0,hb_re_level=0,hb_re_step=0,hb_number=0;
		String id = (String) session.getAttribute("cId");
		Member member = ms.select(id);
		
		if (nm!=null && !nm.contentEquals("")) { // 답변글
			hb_number = Integer.parseInt(nm);
			HelpBoard board = hs.select(hb_number);
			// 답변글이 아니면 ref와 num은 같지만 다변글은 원글의 ref를 사용
			hb_ref = board.getHb_ref();
			hb_re_level = board.getHb_re_level();
			hb_re_step = board.getHb_re_step();
		}
		model.addAttribute("member", member);
		model.addAttribute("hb_ref", hb_ref);
		model.addAttribute("hb_re_level", hb_re_level);
		model.addAttribute("hb_re_step", hb_re_step);
		model.addAttribute("hb_number", hb_number);
		model.addAttribute("pageNum", pageNum);
		return "helpInsertForm";
	}
   @RequestMapping("helpInsert")
	public String insert(HelpBoard board,String pageNum, Model model, 
			HttpServletRequest request, HttpSession session) {
		int number = hs.maxNum();
		if (board.getHb_number() != 0) { // 답	변글
			// re_step값 정리 ref가 같고 re_step크면 +1
			hs.updateStep(board);
			// re_step, re_level은 읽은 글 +1
			board.setHb_re_level(board.getHb_re_level()+1);
			board.setHb_re_step(board.getHb_re_step()+1);
		} else board.setHb_ref(number); // 답변글이 아니면 ref와 num은 같음
		board.setHb_number(number);
		int result = hs.insert(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "helpBoard/helpInsert";
	}
   @RequestMapping("helpUpdateForm")
   public String helpUpdateForm(int num, String pageNum, Model model) {
	   HelpBoard board = hs.select(num);
	   model.addAttribute("board", board);
	   model.addAttribute("pageNum", pageNum);
	   return "helpUpdateForm";
   }
   @RequestMapping("helpUpdate")
   public String helpUpdate(HelpBoard board, String pageNum, Model model) {
	   int result = hs.update(board);
	   model.addAttribute("result", result);
	   model.addAttribute("pageNum", pageNum);
	   return "helpBoard/helpUpdate";
   }
   @RequestMapping("helpView")
   public String helpView(int num, String pageNum, Model model, HttpSession session) {
	   String id = (String) session.getAttribute("cId");
	   Member member = ms.select(id);
	   hs.updateReadCount(num); // 조회수 증가
	   HelpBoard board = hs.select(num);
	   model.addAttribute("member", member);
	   model.addAttribute("pageNum", pageNum);
	   model.addAttribute("board", board);
	   return "helpView";
   }
   @RequestMapping("helpDelete")
   public String helpDelete(int num, String pageNum, Model model) {
	   int result = hs.delete(num);
	   model.addAttribute("pageNum", pageNum);
	   model.addAttribute("result", result);
	   return "helpBoard/helpDelete";
   }
  
   @RequestMapping("location")
   public String location() {
	   
	   return "location/location";
   }

   
}
