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

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/auth/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/auth/login")
	public @ResponseBody ResponseDTO<?> login(@RequestBody User user, HttpSession session) {
		User findUser = userService.getUser(user.getUser_id());
		
		if(findUser.getUser_id() != null) {
			if(findUser.getUser_password().equals(user.getUser_password())) {
				session.setAttribute("user", findUser);
				return new ResponseDTO<>(HttpStatus.OK.value(), findUser.getUser_nickname() + "님 환영합니다.");
			}
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "회원정보를 다시 확인해주세요");
	}
	
	@GetMapping("/auth/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/auth/register")
	public String register() {
		return "user/register";
	}

	@PostMapping("/auth/register")
	public @ResponseBody ResponseDTO<?> register(@RequestBody User user) {
		User findUser = userService.getUser(user.getUser_id());

		if (findUser.getUser_id() == null) {
			userService.register(user);
			return new ResponseDTO<>(HttpStatus.OK.value(), "회원가입이 완료되었습니다.");
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "필수 정보를 다시 확인해주세요.");
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
