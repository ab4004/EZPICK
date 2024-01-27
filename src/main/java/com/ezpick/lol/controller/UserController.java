package com.ezpick.lol.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
				return new ResponseDTO<>(HttpStatus.OK.value(), "");
			}
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "아이디 또는 비밀번호를 잘못 입력했습니다.\r\n" + "입력하신 내용을 다시 확인해주세요.");
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
			// 입력값이 올바르지 않은 경우
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "입력하신 내용을 다시 확인해주세요.");
		}

		// 아이디 중복 확인은 서비스에서 처리하도록 수정
		if (userService.checkUserId(userDTO.getUserId()) || userService.checkUserNickname(userDTO.getUserNickname())) {
			// 중복된 아이디인 경우
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "입력하신 내용을 다시 확인해주세요.");
		}

		// 중복된 아이디가 없는 경우 회원가입 처리
		User userEntity = modelMapper.map(userDTO, User.class);
		userService.register(userEntity);

		return new ResponseDTO<>(HttpStatus.OK.value(), "회원가입이 완료되었습니다.");
	}

	@GetMapping("/auth/checkUserId/{userId}")
	public @ResponseBody ResponseDTO<?> checkUserId(@PathVariable String userId) {
		boolean checkUser = userService.checkUserId(userId);

		if (checkUser) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "이미 사용중인 아이디입니다.");
		} else {
			return new ResponseDTO<>(HttpStatus.OK.value(), "");
		}
	}

	@GetMapping("/auth/checkUserNickname/{userNickname}")
	public @ResponseBody ResponseDTO<?> checkUserNickname(@PathVariable String userNickname) {
		boolean checkUser = userService.checkUserNickname(userNickname);

		if (checkUser) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "이미 사용중인 닉네임입니다.");
		} else {
			return new ResponseDTO<>(HttpStatus.OK.value(), "");
		}
	}

	@GetMapping("/auth/findId")
	public Object findId(@RequestParam(required = false) String userName,
			@RequestParam(required = false) String userPhone) {
		if (userName == null && userPhone == null) {
			return "user/findId";
		} else {
			String findUser = userService.findId(userName, userPhone);
			if (findUser != null) {
				return new ResponseDTO<>(HttpStatus.OK.value(), "");
			}
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "일치하는 회원이 없습니다.\r\n" + "입력하신 내용을 다시 확인해주세요.");
		}
	}
}
