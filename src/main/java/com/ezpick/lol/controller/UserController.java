package com.ezpick.lol.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.User;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.dto.UserDTO;
import com.ezpick.lol.repository.NicknameUpdate;
import com.ezpick.lol.repository.PasswordUpdate;
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
	public String login(HttpSession session) {
		session.invalidate();
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
		if (userService.checkUserId(userDTO.getUserId()) || userService.checkUserNickname(userDTO.getUserNickname())
				|| userService.checkUserEmail(userDTO.getUserEmail())) {
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

	@GetMapping("/auth/checkUserEmail/{userEmail}")
	public @ResponseBody ResponseDTO<?> checkUserEmail(@PathVariable String userEmail) {
		boolean checkUser = userService.checkUserEmail(userEmail);

		if (checkUser) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "이미 가입된 회원입니다.");
		} else {
			return new ResponseDTO<>(HttpStatus.OK.value(), "");
		}
	}

	@GetMapping("/auth/findId")
	public String findId() {
		return "user/findId";
	}

	@PostMapping("/auth/findId")
	public @ResponseBody ResponseDTO<?> findId(@RequestParam String userEmail) {
		String findId = userService.findId(userEmail);
		if (findId != null) {
			return new ResponseDTO<>(HttpStatus.OK.value(), "회원님의 아이디는 " + findId + "입니다");
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "일치하는 회원이 없습니다.\r\n" + "입력하신 내용을 다시 확인해주세요.");
	}

	@GetMapping("/auth/findPassword")
	public String findPassword() {
		return "user/findPassword";
	}

	@PostMapping("/auth/findPassword")
	public @ResponseBody ResponseDTO<?> findPassword(@RequestParam String userId, @RequestParam String userEmail) {
		User findPassword = userService.findUser(userId, userEmail);
		if (findPassword.getUserId() != null) {
			return new ResponseDTO<>(HttpStatus.OK.value(), "");
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "일치하는 회원이 없습니다.\r\n" + "입력하신 내용을 다시 확인해주세요.");
	}

	@PutMapping("/auth/updatePassword")
	public @ResponseBody ResponseDTO<?> updatePassword(@Validated(PasswordUpdate.class) @RequestBody UserDTO userDTO,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "입력하신 내용을 다시 확인해주세요.");
		}
		boolean checkUser = userService.updatePassword(userDTO.getUserId(), userDTO.getUserEmail(),
				userDTO.getUserPassword());

		if (checkUser) {
			return new ResponseDTO<>(HttpStatus.OK.value(), "비밀번호 변경이 완료되었습니다.");
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "비밀번호 변경에 실패하였습니다.");
	}

	@PutMapping("/auth/updateNickname")
	public @ResponseBody ResponseDTO<?> updateNickname(@Validated(NicknameUpdate.class) @RequestBody UserDTO userDTO,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "입력하신 내용을 다시 확인해주세요.");
		}
		boolean checkUser = userService.updateNickname(userDTO.getUserId(), userDTO.getUserEmail(),
				userDTO.getUserNickname());

		if (checkUser) {
			return new ResponseDTO<>(HttpStatus.OK.value(), "닉네임 변경이 완료되었습니다.");
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "닉네임 변경에 실패하였습니다.");
	}

	@GetMapping("/auth/myPage")
	public String myPage() {
		return "user/myPage";
	}
	
	@GetMapping("/auth/deleteUser")
	public String deleteUser() {
		return "user/deleteUser";
	}

	@PostMapping("/auth/myPage")
	public @ResponseBody ResponseDTO<?> myPage(@RequestParam String userPassword, HttpSession session) {
		User findUser = (User) session.getAttribute("user");

		if (findUser != null) {
			if (findUser.getUserPassword().equals(userPassword)) {
				return new ResponseDTO<>(HttpStatus.OK.value(), "");
			} else {
				return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "비밀번호가 일치하지 않습니다.");
			}
		} else {
			return new ResponseDTO<>(HttpStatus.UNAUTHORIZED.value(), "세션이 만료되었거나 로그인되어 있지 않습니다.");
		}
	}

	@DeleteMapping("/auth/deleteUser")
	public @ResponseBody ResponseDTO<?> deleteUser(@RequestParam String userId, @RequestParam String userPassword, HttpSession session) {
		User findUser = (User) session.getAttribute("user");

		if (findUser != null) {
			if (findUser.getUserPassword().equals(userPassword)) {
				userService.deleteUser(findUser.getUserId());
				session.invalidate();
				return new ResponseDTO<>(HttpStatus.OK.value(), "회원 탈퇴가 완료되었습니다.");
			} else {
				return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "비밀번호가 일치하지 않습니다.");
			}
		} else {
			return new ResponseDTO<>(HttpStatus.UNAUTHORIZED.value(), "세션이 만료되었거나 로그인되어 있지 않습니다.");
		}
	}
}