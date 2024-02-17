package com.ezpick.lol.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ezpick.lol.domain.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board, Integer> {

	List<Board> findTop10ByOrderByBoardLikesDescBoardHitsDesc();

}
