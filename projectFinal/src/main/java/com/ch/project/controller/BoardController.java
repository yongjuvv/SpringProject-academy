package com.ch.project.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Member;
import com.ch.project.model.pj_Board;
import com.ch.project.service.BoardService;
import com.ch.project.service.MypageService;
import com.ch.project.service.PagingBean;
@Controller

public class BoardController {
	@Autowired
	private BoardService bs;
	@Autowired
	private MypageService ms;
	
	@RequestMapping("boardList")
	public String boardList(pj_Board pj_board, String pageNum, Model model, Member member, HttpSession session) {  //tiles가 적용되는 list
		if (pageNum==null || pageNum.equals("")) pageNum="1";
		int total = bs.boardGetTotal(pj_board);
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int boardStartRow = (currentPage - 1) * rowPerPage + 1;
		int boardEndRow = boardStartRow + rowPerPage - 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		String cId = (String) session.getAttribute("cId");
	    member = ms.select(cId);
		
		pj_board.setBoardStartRow(boardStartRow);
		pj_board.setBoardEndRow(boardEndRow);
		String[] tit = {"작성자","제목","내용","제목+내용"};
		List<pj_Board> boardList = bs.boardList(pj_board);
		
		int no = total - boardStartRow + 1;
		model.addAttribute("pj_Board", pj_board);
		model.addAttribute("no", no);
		
		model.addAttribute("member", member);
		model.addAttribute("boardList",boardList);
		model.addAttribute("tit", tit);
		model.addAttribute("pb", pb);
		model.addAttribute("pageNum", pageNum);
		return "boardList";
	}
	@RequestMapping("boardList1")
	public String boardList1(pj_Board pj_board, String pageNum, Model model, Member member, HttpSession session) {  //tiles가 적용되지 않는 list1
		if (pageNum==null || pageNum.equals("")) pageNum="1";
		int total = bs.boardGetTotal(pj_board);
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int boardStartRow = (currentPage - 1) * rowPerPage + 1;
		int boardEndRow = boardStartRow + rowPerPage - 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		String id = (String) session.getAttribute("cId");
		member = ms.select(id);
		
		pj_board.setBoardStartRow(boardStartRow);
		pj_board.setBoardEndRow(boardEndRow);
		String[] tit = {"작성자","제목","내용","제목+내용"};
		List<pj_Board> boardList = bs.boardList(pj_board);
		
		int no = total - boardStartRow + 1;
		model.addAttribute("pj_Board", pj_board);
		model.addAttribute("no", no);
		
		model.addAttribute("member", member);
		model.addAttribute("boardList",boardList);
		model.addAttribute("tit", tit);
		model.addAttribute("pb", pb);
		model.addAttribute("pageNum", pageNum);
		return "pj_Board/boardList";  //tiles가 적용되지 않는 list1
	}
	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm(int b_num, String pageNum, Model model) {
		pj_Board pj_board = bs.boardSelect(b_num);
		model.addAttribute("pj_board", pj_board);
		model.addAttribute("pageNum", pageNum);
		return "boardUpdateForm";
	}
	@RequestMapping("boardUpdate")
	public String boardUpdate(pj_Board pj_board, String pageNum, Model model) {
		int result = bs.boardUpdate(pj_board);
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		return "pj_Board/boardUpdate";
	}
	@RequestMapping("boardDeleteForm")
	public String boardDeleteForm(int b_num, String pageNum, Model model) {
		System.out.println("b_num = "+b_num);
		pj_Board pj_board = bs.boardSelect(b_num);
		model.addAttribute("pj_board", pj_board);
		model.addAttribute("pageNum", pageNum);
		return "pj_Board/boardDeleteForm";
	}
	@RequestMapping("boardDelete")
	public String boardDelete(int b_num, String pageNum, Model model) {
		System.out.println("b_num = "+b_num);
		int result = bs.boardDelete(b_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		System.out.println("result = "+result);
		return "pj_Board/boardDelete";
	}
	@RequestMapping("boardView")
	public String boardView(int b_num, String pageNum, Model model, HttpSession session) {
		String id = (String) session.getAttribute("cId");
		Member member = ms.select(id);
		
		bs.boardUpdateReadCount(b_num); // 조회수 증가
		pj_Board pj_board = bs.boardSelect(b_num);
		model.addAttribute("member", member);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pj_board", pj_board);
		return "boardView";
	}
	@RequestMapping("boardInsertForm")
	public String boardInsertForm(String nm, String pageNum, Model model, HttpSession session) {
//		int ref=0,re_level=0,re_step=0,
		int b_num=0;
		pj_Board pj_board = bs.boardSelect(b_num);
		String id = (String) session.getAttribute("cId");
		Member member = ms.select(id);
		
//		if (nm!=null && !nm.contentEquals("")) { // 답변글
//			b_num = Integer.parseInt(nm);
//			Board board = bs.select(b_num);
//			// 답변글이 아니면 ref와 b_num은 같지만 다변글은 원글의 ref를 사용
//			ref = board.getRef();
//			re_level = board.getRe_level();
//			re_step = board.getRe_step();
//		}
//		model.addAttribute("ref", ref);
//		model.addAttribute("re_level", re_level);
//		model.addAttribute("re_step", re_step);
		model.addAttribute("member", member);
		model.addAttribute("b_num", b_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pj_board", pj_board);
		return "boardInsertForm";
	}
	@RequestMapping("boardInsert")
	public String boardInsert(pj_Board pj_board, String pageNum, Model model, HttpServletRequest request, HttpSession session) {
		String b_ip = request.getLocalAddr(); // 사용자 ip
//		pj_board.setB_ip(request.getRemoteAddr());
		pj_board.setB_ip(b_ip);
		int number = bs.boardMaxNum();
//		if (board.getB_num() != 0) { // 답변글
//			// re_step값 정리 ref가 같고 re_step크면 +1
//			bs.updateStep(board);
//			// re_step, re_level은 읽은 글 +1
//			board.setRe_level(board.getRe_level()+1);
//			board.setRe_step(board.getRe_step()+1);
//		} else board.setRef(number); // 답변글이 아니면 ref와 num은 같음
		pj_board.setB_num(number);
		int result = bs.boardInsert(pj_board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "pj_Board/boardInsert";
	}
}