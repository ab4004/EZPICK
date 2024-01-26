package com.ezpick.lol.controller;

import java.util.HashMap;
import java.util.Map;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.User;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.dto.UserDTO;
import com.ezpick.lol.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private ModelMapper modelMapper;

	@GetMapping("/auth/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/auth/login")
	public @ResponseBody ResponseDTO<?> login(@RequestBody User user, HttpSession session) {
		User findUser = userService.getUser(user.getUserId());

		if (findUser.getUserId() != null) {
			if (findUser.getUserPassword().equals(user.getUserPassword())) {
				session.setAttribute("user", findUser);
				return new ResponseDTO<>(HttpStatus.OK.value(), findUser.getUserId() + "님 환영합니다.");
			}
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "로그인에 실패하였습니다.");
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
	public @ResponseBody ResponseDTO<?> register(@Valid @RequestBody UserDTO userDTO, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "필수 정보를 다시 확인해주세요.");
		}

		String userId = userDTO.getUserId();

		// 중복 검사
		if (userService.checkUserId(userId)) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "이미 사용중인 아이디입니다.");
		}

		// 중복이 없으면 회원가입 진행
		User userEntity = modelMapper.map(userDTO, User.class);
		userService.register(userEntity);

		return new ResponseDTO<>(HttpStatus.OK.value(), "회원가입이 완료되었습니다.");
	}

	@GetMapping("/auth/checkUserId/{userId}")
	public @ResponseBody ResponseDTO<?> checkUserId(@PathVariable String userId) {
		boolean checkUserId = userService.checkUserId(userId);

		if (checkUserId) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "이미 사용중인 아이디입니다.");
		} else {
			return new ResponseDTO<>(HttpStatus.OK.value(), "사용 가능한 아이디입니다.");
		}
	}
}
