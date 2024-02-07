package com.ezpick.lol.controller;

import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezpick.lol.domain.Book;
import com.ezpick.lol.service.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;

	@GetMapping("/match")
	public String getMatchAndBook(Model model, @RequestParam(required = false, defaultValue = "0") int month,  @RequestParam(required = false) String team) {
		int[] monthList = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
		List<Book> bookList = null;
		
		model.addAttribute("currentDate", LocalDateTime.now());
		model.addAttribute("months", monthList);
		
		// 파라미터에 월 데이터가 들어왔을 경우
		if (month != 0) {
			if (team != null) { // 월 데이터와 팀 데이터를 받았을 경우
				bookList = bookService.getTeamAllList(YearMonth.of(YearMonth.now().getYear(), month), team);
			} else { // 월 데이터는 있으나 팀 데이터는 없을 경우
				bookList = bookService.getAllList(YearMonth.of(YearMonth.now().getYear(), month));
			}
		} else if (month == 0 && team != null) { // 월 클릭 없이 팀만 클릭했을 경우
			month = YearMonth.now().getMonthValue();
			bookList = bookService.getTeamAllList(YearMonth.of(YearMonth.now().getYear(), month), team);
		} else { // 두 데이터가 없을 경우 현재 기준으로 리스트 가져옴
			month = YearMonth.now().getMonthValue();
			bookList = bookService.getAllList(YearMonth.now());
		}
		
		model.addAttribute("selectedMonth", month); // 선택한 월
		model.addAttribute("book", bookList);
		
		return "book/matchAndBook";
	}
}