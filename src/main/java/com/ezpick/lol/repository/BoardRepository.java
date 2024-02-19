package com.ezpick.lol.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ezpick.lol.domain.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board, Integer> {

	// 인기글 top10이고, 좋아요 수와 조회수 순으로 정렬
	List<Board> findTop10ByOrderByBoardLikesDescBoardHitsDesc();

	// 카테고리 기준으로 정렬
	Page<Board> findByCategoryNo(int categoryNo, Pageable pageable);
}
