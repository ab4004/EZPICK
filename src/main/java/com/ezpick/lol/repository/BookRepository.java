package com.ezpick.lol.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ezpick.lol.domain.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

	List<Book> findAllByDate(LocalDateTime date);

	// JPQL(Java Persistence Query Language - 테이블이 아닌 엔티티 객체 대상으로 쿼리)
	@Query("SELECT b FROM Book b WHERE b.date >= :startOfMonth AND b.date < :startOfNextMonth ORDER BY b.date")
	List<Book> findAllByMonth(@Param("startOfMonth") LocalDateTime startOfMonth,
			@Param("startOfNextMonth") LocalDateTime startOfNextMonth);

	@Query("SELECT b FROM Book b WHERE b.date >= :startOfMonth AND b.date < :startOfNextMonth AND (b.homeTeam = :team OR b.awayTeam = :team) ORDER BY b.date")
	List<Book> findAllByMonthAndTeam(@Param("startOfMonth") LocalDateTime startOfMonth,
			@Param("startOfNextMonth") LocalDateTime startOfNextMonth, @Param("team") String team);
	
	// (승부예측) 주차별 경기 일정 리스트
	List<Book> findAllByDateBetween(LocalDateTime startDate, LocalDateTime endDate, Sort sort);
	
	// 매칭 총 수
	@Query("SELECT COUNT(b.status) FROM Book b WHERE b.status = '종료'")
	int countByBookstatus();
}
