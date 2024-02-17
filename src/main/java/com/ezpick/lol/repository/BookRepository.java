package com.ezpick.lol.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ezpick.lol.domain.Book;


public interface BookRepository extends JpaRepository<Book, Integer> {
	
	List<Book> findAllByDate(LocalDateTime date);
	
	// JPQL(Java Persistence Query Language - 테이블이 아닌 엔티티 객체 대상으로 쿼리)
	@Query("SELECT b FROM Book b WHERE b.date >= :startOfMonth AND b.date < :startOfNextMonth")
    List<Book> findAllByMonth(@Param("startOfMonth") LocalDateTime startOfMonth, @Param("startOfNextMonth") LocalDateTime startOfNextMonth);
	
	@Query("SELECT b FROM Book b WHERE b.date >= :startOfMonth AND b.date < :startOfNextMonth AND (b.homeTeam = :team OR b.awayTeam = :team)")
    List<Book> findAllByMonthAndTeam(@Param("startOfMonth") LocalDateTime startOfMonth, @Param("startOfNextMonth") LocalDateTime startOfNextMonth, @Param("team") String team);
}
