package com.ch.ch09.controller;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch09.model.Email;
@Controller
public class MailController {
	@Autowired
	private JavaMailSender jMailSender;
	@RequestMapping("mailForm")
	public String mailForm() {
		return "etc/mailForm";
	}
	@RequestMapping("json")
	public String json() {
		return "etc/json";
	}
	@RequestMapping("mail")
	public String mail(Email em, Model model) {
		MimeMessage mm = jMailSender.createMimeMessage();
		try {
			MimeMessageHelper mmh = 
				new MimeMessageHelper(mm, true, "utf-8");
			mmh.setSubject(em.getTitle());
			mmh.setText(em.getContent());
			mmh.setTo(em.getEmail());
			mmh.setFrom("kbj010@naver.com");
			jMailSender.send(mm);
			model.addAttribute("msg", "메일 보내기!! 성공");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("msg", "메일 보내기!! 에고고");
		}
		return "etc/mail";
	}
}