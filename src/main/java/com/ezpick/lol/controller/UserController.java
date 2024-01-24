package com.ezpick.lol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.User;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/auth/login")
	public String login() {
		return "user/login";
	}

	@GetMapping("/auth/register")
	public String register(User user) {
		return "user/register";
	}

	@PostMapping("/auth/getUser")
	public @ResponseBody ResponseDTO<?> getUser(@RequestBody User user) {
		User findUser = userService.getUser(user.getUser_id());

		if (findUser.getUser_id() == null) {
			return new ResponseDTO<>(HttpStatus.OK.value(), "사용 가능한 아이디입니다.");
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "이미 사용중인 아이디입니다.");
	}
}
