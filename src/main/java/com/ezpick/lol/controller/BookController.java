package com.ezpick.lol.controller;

import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.Book;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.service.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;

//--------------------------------------------------------------------------------------------

	// 경기 일정 데이터 삽입 화면
	@GetMapping("/book/insertBook")
	public String insertBook() {
		return "book/insertBook";
	}

	// 경기 일정 데이터 삽입
	@PostMapping("/book/insertBook")
	public @ResponseBody ResponseDTO<?> insertBook(@RequestBody Book book) {

		if (book != null) {

			bookService.insertBook(book);

			return new ResponseDTO<>(HttpStatus.OK.value(), "경기 일정 데이터 삽입 성공");
		}

		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "경기 일정 데이터 삽입 실패");
	}

// ----------------------------------------------------------------------------------------------------	
	


	// 1월 전체
	@GetMapping("/janAllDate")
	public String janAllDate(Model model, @RequestParam YearMonth date) {

		List<Book> janAll = bookService.date(date);

		model.addAttribute("janAll", janAll);

		return "book/janAll";
	}

	// 1월 전체(조건문)
		@GetMapping("/janAll")
		public String janAll(Model model, @RequestParam YearMonth date, @RequestParam String team)		{

			List<Book> janAll;
			
			List<Book> dateHome = bookService.dateHome(date, team);
			List<Book> dateAway = bookService.dateAway(date, team);

			janAll = new ArrayList<>(dateHome);
			janAll.addAll(dateAway);

			Collections.sort(janAll, Comparator.comparing(Book::getTime));	
			model.addAttribute("janAll", janAll);
			
		

			return "book/janAll";

		}
	
//----------------------------------------------------------------------------------
	
	  // 2월 일정 ( 전체 )
	  
	  @GetMapping("/febAllDate") 
	 public String febAll(Model model, @RequestParam  YearMonth date) {
	 
	  List<Book> febAll = bookService.date(date);
	 
	  model.addAttribute("febAll", febAll);
	  
	  return "book/febAll"; 
	  }
	 
	  

	// 2월 일정 ( 팀별 )
	@GetMapping("/febAll")
	public String febAll(Model model, @RequestParam YearMonth date, @RequestParam String team) {

		List<Book> febAll;
		

			List<Book> dateHome = bookService.dateHome(date, team);
			List<Book> dateAway = bookService.dateAway(date, team);

			febAll = new ArrayList<>(dateHome);
			febAll.addAll(dateAway);

			model.addAttribute("febAll", febAll);
			Collections.sort(febAll, Comparator.comparing(Book::getTime));

		

		return "book/febAll";

	}

//----------------------------------------------------------------------
	// 3월 전체
	@GetMapping("/marAllDate")
	public String marAll(Model model, @RequestParam YearMonth date) {

		List<Book> marAll = bookService.date(date);

		model.addAttribute("marAll", marAll);

		return "book/marAll";
	}
	
	// 3월 전체(연습)
		@GetMapping("/marAll")
		public String book(Model model, @RequestParam YearMonth date, @RequestParam String team) {

				List<Book> marAll;			

				List<Book> dateHome = bookService.dateHome(date, team);
				List<Book> dateAway = bookService.dateAway(date, team);

				marAll = new ArrayList<>(dateHome);
				marAll.addAll(dateAway);

				model.addAttribute("marAll", marAll);
				Collections.sort(marAll, Comparator.comparing(Book::getTime));

			
			return "book/marAll";

		}


}