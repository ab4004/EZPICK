package com.ezpick.lol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.Book;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.service.BookService;

@Controller
public class AdminController {

	@Autowired
	private BookService bookService;

	@GetMapping("/admin/page")
	public String adminPage() {
		return "user/admin";
	}

	// 경기 일정 데이터 삽입 화면
	@GetMapping("/admin/insertBook")
	public String insertBook() {
		return "book/insertBook";
	}

	// 경기 일정 데이터 삽입
	@PostMapping("/admin/insertBook")
	public @ResponseBody ResponseDTO<?> insertBook(@RequestBody Book book) {
		if (book != null) {
			bookService.insertBook(book);
			return new ResponseDTO<>(HttpStatus.OK.value(), "경기 일정 데이터 삽입 성공");
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "경기 일정 데이터 삽입 실패");
	}
}
