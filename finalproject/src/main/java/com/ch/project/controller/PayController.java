package com.ch.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.project.model.Movie;
import com.ch.project.model.PMember;
import com.ch.project.model.Pay;
import com.ch.project.model.Tv;
import com.ch.project.model.TvEp;
import com.ch.project.service.MovieService;
import com.ch.project.service.PMemberService;
import com.ch.project.service.PayService;
import com.ch.project.service.TvEpService;
import com.ch.project.service.TvService;

@Controller
public class PayController {
	@Autowired
	private PayService ps;
	@Autowired
	private PMemberService pms;
	@Autowired
	private MovieService ms;
	@Autowired
	private TvService ts;
	@Autowired
	private TvEpService tes;

	@RequestMapping("movPayForm")
	public String movPayForm(HttpSession session, int movNum, Model model) {
		String email = (String) session.getAttribute("email");
		PMember pmember = pms.select(email);
		Movie movie = ms.select(movNum);
		int balance = pmember.getMemPoint() - movie.getMovPrice();
		model.addAttribute("pmember", pmember);
		model.addAttribute("movie", movie);
		model.addAttribute("balance", balance);
		return "pointNpay/movPayForm";
	}

	@RequestMapping("movPay")
	public String movPay(HttpSession session, int movNum, int balance, Model model) {

		String email = (String) session.getAttribute("email");

		if (email != null) {
			int result = 0;
			if (balance >= 0) {
				Pay pay = ps.payMovConfirm(email, movNum);
				if (pay == null) {
					result = ps.payMovInsert(email, movNum);
					if (result == 1) {
						result = pms.memPointUpdate2(email, movNum);
					}
				} else
					result = -1;
			}

			String movName = ms.select(movNum).getMovName();

			model.addAttribute("movName", movName);
			model.addAttribute("movNum", movNum);
			model.addAttribute("result", result);
		}
		return "pointNpay/movPay";

	}

	@RequestMapping("tvPayForm")
	public String tvPayForm(HttpSession session, int tvNum, int tvEpNum, Model model) {

		String email = (String) session.getAttribute("email");

		if (email != null) {
			PMember pmember = pms.select(email);
			Tv tv = ts.select(tvNum);
			TvEp tvEp = tes.select(tvNum, tvEpNum);
			int balance = pmember.getMemPoint() - tvEp.getTvEpPrice();

			model.addAttribute("pmember", pmember);
			model.addAttribute("tv", tv);
			model.addAttribute("tvEp", tvEp);
			model.addAttribute("balance", balance);
		}
		return "pointNpay/tvPayForm";
	}

	@RequestMapping("tvPay")
	public String tvPay(HttpSession session, HttpServletRequest request, int balance, Model model) {

		String email = (String) session.getAttribute("email");

		if (email != null) {
			int tvNum = Integer.parseInt((String) request.getParameter("tvNum"));
			int tvEpNum = Integer.parseInt((String) request.getParameter("tvEpNum"));
			int result = 0;
			if (balance >= 0) {
				Pay pay = ps.paytvConfirm(email, tvNum, tvEpNum);
				if (pay == null) {
					result = ps.payTvInsert(email, tvNum, tvEpNum);
					if (result == 1) {
						result = pms.memPointUpdate3(email, tvNum, tvEpNum);
					}
				} else
					result = -1;
			}
			String tvName = ts.select(tvNum).getTvName();

			model.addAttribute("tvName", tvName);
			model.addAttribute("tvNum", tvNum);
			model.addAttribute("tvEpNum", tvEpNum);
			model.addAttribute("result", result);
		}

		return "pointNpay/tvPay";

	}

	@RequestMapping(value = "tvPayConfirm", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int tvPayConfirm(int tvNum, int tvEpNum, HttpSession session, Model model) {

		String email = (String) session.getAttribute("email");

		int result = 0;
		Pay pc = ps.paytvConfirm(email, tvNum, tvEpNum);

		if (pc != null) {
			if (pc.getPayState().equals("y"))
				result = 1;
			else if (pc.getPayState().equals("n"))
				result = 0;
		}
		return result;
	}
}
