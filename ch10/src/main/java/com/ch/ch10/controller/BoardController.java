package com.ch.ch10.controller;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.ch10.model.Board;
import com.ch.ch10.service.BoardService;
import com.ch.ch10.service.PagingBean;
@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	@RequestMapping("/list")
	public String initList() {
		return "redirect:/list/pageNum/1";
	}
	@RequestMapping("/list/pageNum/{pageNum}")
	public String list(@PathVariable String pageNum, Board board, Model model) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage  = 10;
//		int total = bs.getTotal();
		int total = bs.getTotal(board); 
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int no = total - startRow + 1; // 페이지별 시작번호
		board.setStartRow(startRow);
		board.setEndRow(endRow);
//		Collection<Board> list = bs.list(startRow, endRow);
		Collection<Board> list = bs.list(board);
		PagingBean pb=new PagingBean(currentPage,rowPerPage,total);
		String tit[] = {"작성자","제목","내용","제목+내용"};
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pb", pb);
		model.addAttribute("board", board);
		model.addAttribute("tit", tit);
		return "list";
	}
	@RequestMapping("/insertForm/nm/{nm}/pageNum/{pageNum}")
	public String insertForm(@PathVariable String nm,
			@PathVariable String pageNum, Model model) {
		int ref = 0, re_level = 0, re_step = 0, num = 0;
		if (nm != null && !nm.equals("") && !nm.equals("null")) { // 답변글
			num = Integer.parseInt(nm);
			Board board = bs.select(num);
			// 답변글이 아니면 num과 ref는 같다
			// 답변글은 읽은 글의 ref값을 답변글의 ref에 반영
			ref = board.getRef();  
			re_level = board.getRe_level();
			re_step  = board.getRe_step();
		}
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("num", num);
		
		return "insertForm";
	}
	@RequestMapping("/insert")
	public String insert(Board board, String pageNum, Model model,
			HttpServletRequest request) {
		board.setIp(request.getRemoteAddr()); // 작성자 ip
		int number = bs.maxNum();
		if (board.getNum() != 0) {  // 답변글
			// re_step값을 정해
			bs.updateStep(board);
			// 읽은 글의 re_step과 re_level보다 1씩 증가
			board.setRe_level(board.getRe_level() + 1);
			board.setRe_step(board.getRe_step() + 1);			
		} else board.setRef(number); // 답변글이 아닐 때
		board.setNum(number);
		int result = bs.insert(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "insert";
	}
	@RequestMapping("/view/num/{num}/pageNum/{pageNum}")
	public String view(@PathVariable int num,
			@PathVariable String pageNum, Model model) {
		bs.updateReadCount(num);
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "view";
	}
	@RequestMapping("/updateForm/num/{num}/pageNum/{pageNum}")
	public String updateForm(@PathVariable int num,
			@PathVariable String pageNum, Model model) {
		Board board = bs.select(num);
		String content = board.getContent();
		String st =content.replace("<br>", "\r\n");
		board.setContent(st);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "updateForm";
	}
	@RequestMapping("/update")
	public String update(Board board, String pageNum, Model model) {
		String st = board.getContent().replace("\r\n", "<br>");
		board.setContent(st);
		int result = bs.update(board);
		model.addAttribute("result", result);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "update";
	}
	@RequestMapping("/deleteForm/num/{num}/pageNum/{pageNum}")
	public String deleteForm(@PathVariable int num,
		   @PathVariable String pageNum, Model model) {
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "deleteForm";
	}
	@RequestMapping("/delete")
	public String delete(int num, String pageNum, Model model) {
		int result = bs.delete(num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum",pageNum);
		return "delete";
	}
}


