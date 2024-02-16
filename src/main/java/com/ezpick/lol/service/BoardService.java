package com.ezpick.lol.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezpick.lol.domain.Board;
import com.ezpick.lol.repository.BoardRepository;


@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	@Transactional
	public void insertBoard(Board board) {
//		board.setBoardHits(0);
		boardRepository.save(board);
	}

	@Transactional(readOnly = true)
	public Page<Board> getBoardList(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}

	@Transactional
	public Board getBoard(int boardSeq) {
		Board findBoard = boardRepository.findById(boardSeq).get();
		findBoard.setBoardHits(findBoard.getBoardHits() + 1);
		return findBoard;
	}

	@Transactional
	public void updateBoard(Board board) {
		Board findBoard = boardRepository.findById(board.getBoardSeq()).get();
		findBoard.setBoardTitle(board.getBoardTitle());
		findBoard.setBoardContent(board.getBoardContent());
		findBoard.setCategoryNo(board.getCategoryNo());
		findBoard.setBoardCrtDate(LocalDateTime.now());
	}

	@Transactional
	public void deleteBoard(int boardSeq) {
		boardRepository.deleteById(boardSeq);

	}
}
