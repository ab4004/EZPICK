package com.ezpick.lol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.service.MailService;

@Controller
public class MailController {

	@Autowired
	private MailService mailService;

	@GetMapping("/auth/checkEmail")
	public String mailPage() {
		return "user/register";
	}

	@ResponseBody
	@PostMapping("/auth/checkEmail")
	public String MailSend(String mail) {
		int number = mailService.sendMail(mail);
		String num = "" + number;
		return num;
	}
}