package com.ch.ch11;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ChatController {
	@RequestMapping("chat")
	public String chat() {
		return "chat";
	}
}