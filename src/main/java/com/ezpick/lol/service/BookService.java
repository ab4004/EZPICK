package com.ezpick.lol.service;

import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezpick.lol.domain.Book;
import com.ezpick.lol.repository.BookRepository;

@Service
public class BookService {

	@Autowired
	private BookRepository bookRepository;
	
	// 월(MONTH)에 맞는 경기 일정 리스트
	@Transactional(readOnly = true)
	public List<Book> getAllList(YearMonth yearMonth) {
		LocalDateTime startOfMonth = yearMonth.atDay(1).atStartOfDay();
		LocalDateTime startOfNextMonth = yearMonth.plusMonths(1).atDay(1).atStartOfDay();

		return bookRepository.findAllByMonth(startOfMonth, startOfNextMonth);
	}
	
	// 월(MONTH)과 팀(TEAM)이 맞는 일정 리스트
	@Transactional(readOnly = true)
	public List<Book> getTeamAllList(YearMonth yearMonth, String team) {
		LocalDateTime startOfMonth = yearMonth.atDay(1).atStartOfDay();
		LocalDateTime startOfNextMonth = yearMonth.plusMonths(1).atDay(1).atStartOfDay();

		return bookRepository.findAllByMonthAndTeam(startOfMonth, startOfNextMonth, team);
	}		
	
	// 경기 일정 데이터 삽입 ( 사용 )
	@Transactional
	public void insertBook(Book book) {
		bookRepository.save(book);
	}
}
