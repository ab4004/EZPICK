package com.ezpick.lol.service;

import java.time.LocalDateTime;
import java.util.List;

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

	// 글 작성
	@Transactional
	public void insertBoard(Board board) {
		boardRepository.save(board);
	}

	// 게시글 목록
	@Transactional(readOnly = true)
	public Page<Board> getBoardList(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}

	// 상세 글
	@Transactional
	public Board getBoard(int boardSeq) {
		Board findBoard = boardRepository.findById(boardSeq).get();
		findBoard.setBoardHits(findBoard.getBoardHits() + 1);
		return findBoard;
	}

	// 글 수정
	@Transactional
	public void updateBoard(Board board) {
		Board findBoard = boardRepository.findById(board.getBoardSeq()).get();
		findBoard.setBoardTitle(board.getBoardTitle());
		findBoard.setBoardContent(board.getBoardContent());
		findBoard.setCategoryNo(board.getCategoryNo());
		findBoard.setBoardCrtDate(LocalDateTime.now());
	}

	// 글 삭제
	@Transactional
	public void deleteBoard(int boardSeq) {
		boardRepository.deleteById(boardSeq);
	}

	// 좋아요
	@Transactional
	public void likeUp(int boardSeq) {
		Board findBoard = boardRepository.findById(boardSeq).get();
		findBoard.setBoardLikes(findBoard.getBoardLikes() + 1);
	}

	// 싫어요
	@Transactional
	public void hateUp(int boardSeq) {
		Board findBoard = boardRepository.findById(boardSeq).get();
		findBoard.setBoardHates(findBoard.getBoardHates() + 1);
	}

	// 인기글 TOP10
	@Transactional(readOnly = true)
	public List<Board> getTopTen() {
		return boardRepository.findTop10ByOrderByBoardLikesDescBoardHitsDesc();
	}

	// 카테고리 기준 정렬
	@Transactional(readOnly = true)
	public Page<Board> getCategoryBoard(int categoryNo, Pageable pageable) {
		return boardRepository.findByCategoryNo(categoryNo, pageable);
	}

	// 검색 내용(제목 + 내용) 리스트
	@Transactional(readOnly = true)
	public Page<Board> getTitleAndContent(String keyword, Pageable pageable) {
		return boardRepository.findByTitleOrContent(keyword, pageable);
	}

	// 검색 내용(작성자) 리스트
	@Transactional(readOnly = true)
	public Page<Board> getWriter(String keyword, Pageable pageable) {
		return boardRepository.findByWriter(keyword, pageable);
	}
}
