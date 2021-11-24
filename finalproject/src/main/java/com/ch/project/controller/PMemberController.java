package com.ch.project.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.project.model.PMember;
import com.ch.project.service.HashtagService;
import com.ch.project.service.PMemberService;
import com.ch.project.service.ReviewService;

@Controller
public class PMemberController {

	@Autowired
	private PMemberService ps;
	@Autowired
	private HashtagService hs;
	@Autowired
	private ReviewService rs;

	@RequestMapping("joinForm")
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping(value = "emailChk", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int emailChk(String email, Model model) {
		int result = 0;
		result = ps.emailChk(email);
		return result;
	}

	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping("login")
	public String login(PMember pmember, Model model, HttpSession session) {
		int result = 0;
		PMember mem = ps.select(pmember.getEmail());
		if (mem == null || mem.getMemDel().equals("y"))
			result = -1;
		else {
			if (mem.getPass().equals(pmember.getPass())) {
				session.setAttribute("email", pmember.getEmail());
				result = 1;
			} else {
				result = 0;
			}
		}
		model.addAttribute("result", result);
		return "member/login";
	}

	@RequestMapping("memUpdateForm")
	public String UpdateForm() {
		return "member/memUpdateForm";
	}

	@RequestMapping("myPage")
	public String myPage(Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email != null) {
			PMember pmember = ps.select(email);
			model.addAttribute("pmember", pmember);
			int countMovie = rs.countMovie(email);
			model.addAttribute("countMovie", countMovie);
			int countTv = rs.countTv(email);
			model.addAttribute("countTv", countTv);
		}
		int count = hs.count();
		model.addAttribute("count", count);
		return "member/myPage";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}

	@RequestMapping("memDelForm")
	public String memDelForm() {
		return "member/delForm";
	}

	@RequestMapping(value = "passChk", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int passChk(String pass, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		PMember pmember = ps.select(email);
		String sessionPass = pmember.getPass();
		if (pass.equals(sessionPass))
			return 1;
		else
			return 0;
	}

	@RequestMapping("memDelForm2")
	public String memDelForm2() {
		return "member/delForm2";
	}

	@RequestMapping("memDel")
	public String memdel(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		int result = ps.delete(email);
		model.addAttribute("result", result);
		return "member/delete";
	}

	@RequestMapping("view")
	public String view(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		PMember pmember = ps.select(email);
		model.addAttribute("pmember", pmember);
		return "member/view";
	}

	@RequestMapping(value = "memUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int memUpdate(String nickName, Date memBirth, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		PMember pmember = new PMember();
		pmember.setEmail(email);
		pmember.setNickName(nickName);
		pmember.setMemBirth(memBirth);
		int result = ps.update(pmember);
		return result;
	}

	@RequestMapping("pChargeForm")
	public String pChargeForm(HttpSession session, HttpServletRequest request, Model model) {
		String email = (String) session.getAttribute("email");
		int movNum = 0;
		String movNum1 = (String) request.getParameter("movNum");
		if (movNum1 != null) {
			movNum = Integer.parseInt(movNum1);
		}
		PMember pmember = ps.select(email);
		model.addAttribute("pmember", pmember);
		model.addAttribute("movNum", movNum);
		return "pointNpay/pChargeForm";
	}

	@RequestMapping("passChkForm")
	public String passChkForm(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		String pass = ps.select(email).getPass();
		model.addAttribute("pass", pass);
		return "member/passChkForm";
	}

	@RequestMapping("passUpdateForm")
	public String passUpdateForm() {
		return "member/passUpdateForm";
	}

	@RequestMapping("passUpdate")
	public String passUpdate(HttpSession session, String pass2, Model model) {
		String email = (String) session.getAttribute("email");
		int result = ps.passUpdate(email, pass2);
		model.addAttribute("result", result);
		return "member/passUpdate";
	}

	@RequestMapping(value = "login2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int login2(String email, String password, HttpSession session) {
		int result = 0;
		PMember mem = ps.select(email);
		if (mem == null || mem.getMemDel().equals("y"))
			result = -1;
		else {
			if (mem.getPass().equals(password)) {
				session.setAttribute("email", email);
				result = 1;
			} else {
				result = 0;
			}
		}
		return result;
	}

	@RequestMapping("join2")
	public String join2(PMember pmember, Model model) {
		int result = ps.insert(pmember);
		model.addAttribute("result", result);
		return "member/join";
	}
}
