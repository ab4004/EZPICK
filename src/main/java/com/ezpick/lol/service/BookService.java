package com.ezpick.lol.service;

import java.time.YearMonth;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezpick.lol.domain.Book;
import com.ezpick.lol.repository.BookRepository;

@Service
public class BookService {

	@Autowired
	private BookRepository bookRepository;
		
//----------------------------------------------------------------------------
	
	   // 경기 일정 데이터 삽입 ( 사용 )
	   @Transactional
	   public void insertBook(Book book) {
	         
	      bookRepository.save(book);
	      
	   }
	   
//--------------------- 가능 / 불가능 ------------------------------------------------------------
	   	
	   // 일정 전체  ( 사용 )
	    @Transactional
	    public List<Book> date(YearMonth date) {
	    	
	        int monthValue = date.getMonthValue();
	        List<Book> books = bookRepository.findAllByDate(date, Sort.by(Sort.Order.asc("time")));
	        
	        return books.stream()
	                .filter(book -> book.getDate().getMonthValue() == monthValue)
	                .collect(Collectors.toList());
	    }
	   
	   
//----------------------------------------------------------------------------------------------------------
	   
	
	   // 홈 팀 ( 사용 )
	   @Transactional
	    public List<Book> dateHome(YearMonth date, String homeTeam) {
		   
		   int monthValue = date.getMonthValue();
	    
	        List<Book> books = bookRepository.findAllByDateAndHomeTeam(date, homeTeam, Sort.by(Sort.Order.asc("time")));
	        
	        return books.stream()
	               .filter(book -> book.getDate().getMonthValue() == monthValue)
	               .collect(Collectors.toList());
	        
	       
	    }
	   
	   //--------------------------------------------------------------------------------
	   
	   // 원정 팀 ( 사용 )
	   @Transactional
	    public List<Book> dateAway(YearMonth date, String awayTeam) {
		   
		   int monthValue = date.getMonthValue();
	    
	        List<Book> books = bookRepository.findAllByDateAndAwayTeam(date, awayTeam, Sort.by(Sort.Order.asc("time")));
	        
	        return books.stream()
	        		.filter(book -> book.getDate().getMonthValue() == monthValue)
	        		.collect(Collectors.toList());
	        
	       
	    }
	   
//--------------------------------------------------------------------------------
	   	   
	   /*
	   // 홈 팀, 원정 팀 ( 미 사용)
	   @Transactional
	    public List<Book> bookHomeAway(YearMonth date, String homeTeam, List<String> awayTeam) {
		   
		   int monthValue = date.getMonthValue();
	    
	        List<Book> books = bookRepository.findAllByDateAndHomeTeamAndAwayTeamIn(date, homeTeam, awayTeam, Sort.by(Sort.Order.asc("time")));
	        
	        return books.stream()
	               .filter(book -> book.getDate().getMonthValue() == monthValue)
	              
	               .collect(Collectors.toList());
	        
	       
	    }
	    */
	
	  
}
