package com.ezpick.lol.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ezpick.lol.domain.Book;
import com.ezpick.lol.domain.Pdb;
import com.ezpick.lol.domain.User;

@Repository
public interface PdbRepository extends JpaRepository<Pdb, Integer> {

	List<Pdb> findByUserIdAndBook(User userId, Book book);

	List<Pdb> findByUserId(User userId);

	List<Pdb> findByBook(Book book);
	
	@Query("SELECT p.userId, SUM(p.hits) totalHits FROM Pdb p INNER JOIN p.book b WHERE b.status <> '예정' GROUP BY p.userId order by totalHits DESC")
	List<Object[]> findUserIdAndTotalHits();
	
	@Modifying
	@Query("UPDATE Pdb p SET p.hits = 1 WHERE p.pick IN (SELECT b.result FROM Book b WHERE p.book.id = b.id)")
	void updateHits();
}
