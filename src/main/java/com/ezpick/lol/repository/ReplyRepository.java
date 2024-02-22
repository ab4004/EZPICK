package com.ezpick.lol.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ezpick.lol.domain.Board;
import com.ezpick.lol.domain.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Integer> {
	List<Reply> findByBoardOrderByLikeDesc(Board board);
}
