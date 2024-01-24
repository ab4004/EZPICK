package com.ezpick.lol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.ezpick.lol.domain.User;
import com.ezpick.lol.dto.ResponseDTO;

@Controller
public class UserController {

	@GetMapping("/auth/login")
	public String login() {
		return "user/login";
	}
	
	@GetMapping("/auth/register")
	public String register() {
		return "user/register";
	}
}
