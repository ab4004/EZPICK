package com.ezpick.lol.repository;

import java.time.YearMonth;
import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ezpick.lol.domain.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {
			
	// 날짜 (사용)
	List<Book> findAllByDate(YearMonth date, Sort sort);			
	
	// 날짜, 홈 팀(사용)
	List<Book> findAllByDateAndHomeTeam(YearMonth date, String homeTeam, Sort sort);
	
	// 날짜, 원정 팀(사용)
	List<Book> findAllByDateAndAwayTeam(YearMonth date, String awayTeam, Sort sort);
	
//---------- 사용 / 미사용------------------------------------------------
		
	/*	
	 // 홈 팀 ( 미사용 )
	List<Book> findAllByHomeTeam(String homeTeam);
	
	// 원정 팀 ( 미사용 )
	List<Book> findAllByAwayTeam(String awayTeam);
	
	// 날짜, 홈 팀, 원정 팀( 미사용 )
	List<Book> findAllByDateAndHomeTeamAndAwayTeamIn(YearMonth date, String homeTeam, List<String> awayTeam, Sort sort);
	
	// 날짜, 홈 팀, 원정 팀( 미사용 )
	List<Book> findAllByDateAndHomeTeamOrAwayTeamIn(YearMonth date, String homeTeam, List<String> awayTeam, Sort sort);
*/
}
