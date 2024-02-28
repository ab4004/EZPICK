package com.ezpick.lol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.Board;
import com.ezpick.lol.domain.User;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.service.BoardService;
import com.ezpick.lol.service.ReplyService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	// 커뮤니티 메인화면
	@GetMapping("/board")
	public String getBoardList(Model model, @RequestParam(defaultValue = "all") String category,
			@RequestParam(defaultValue = "latest") String sort, @RequestParam(defaultValue = "0") int page,
			@RequestParam(required = false) String condition, @RequestParam(required = false) String keyword) {
		Pageable pageable;

		// 인기순 정렬과 최신순 정렬
		if (sort.equals("popular")) {
			pageable = PageRequest.of(page, 15, Sort.by("boardLikes").descending());
		} else {
			pageable = PageRequest.of(page, 15, Sort.by("boardWrtDate").descending());
		}

		Page<Board> boardPage;

		// 게시판에서 검색 내역 확인(없으면 카테고리별 리스트)
		if (condition != null && keyword != null && !keyword.isEmpty()) {
			if (condition.equals("titleAndContent")) {
				boardPage = boardService.getTitleAndContent(keyword, pageable);
				model.addAttribute("condition", condition);
				model.addAttribute("keyword", keyword);
			} else {
				boardPage = boardService.getWriter(keyword, pageable);
				model.addAttribute("condition", condition);
				model.addAttribute("keyword", keyword);
			}
		} else {
			// 카테고리별 페이지 리스트
			if (category.equals("자유")) {
				boardPage = boardService.getCategoryBoard(1, pageable);
			} else if (category.equals("유머")) {
				boardPage = boardService.getCategoryBoard(2, pageable);
			} else if (category.equals("사건")) {
				boardPage = boardService.getCategoryBoard(3, pageable);
			} else if (category.equals("정보")) {
				boardPage = boardService.getCategoryBoard(4, pageable);
			} else {
				boardPage = boardService.getBoardList(pageable);
			}
		}

		List<Board> boardList = boardPage.getContent();

		model.addAttribute("boardList", boardList);
		model.addAttribute("currentNumber", boardPage.getNumber());
		model.addAttribute("totalPages", boardPage.getTotalPages());
		model.addAttribute("topTen", boardService.getTopTen());
		model.addAttribute("sort", sort);
		model.addAttribute("category", category);

		return "board/boardList";
	}

	// 게시글 작성 페이지
	@GetMapping("/board/insertBoard")
	public String insertBoard(Model model) {
		model.addAttribute("topTen", boardService.getTopTen());
		return "board/insertBoard";
	}

	// 상세 게시글 페이지 + 댓글 포함
	@GetMapping("/board/detail/{boardSeq}")
	public String getBoard(@PathVariable int boardSeq, Model model) {
		Board board = boardService.getBoard(boardSeq);

		if (board != null) {
			model.addAttribute("board", board);
			model.addAttribute("topTen", boardService.getTopTen());
			model.addAttribute("replies", replyService.getReplyList(board));
		}
		return "board/getBoard";
	}

	// 게시글 수정 페이지
	@GetMapping("/board/updateBoard/{boardSeq}")
	public String updateBoard(@PathVariable int boardSeq, Model model) {
		model.addAttribute("board", boardService.getBoard(boardSeq));
		model.addAttribute("topTen", boardService.getTopTen());
		return "board/updateBoard";
	}

	// 게시글 삽입
	@PostMapping("/board/insertBoard")
	public @ResponseBody ResponseDTO<?> insertBoard(@RequestBody Board board, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null && !board.getBoardTitle().trim().equals("") && !board.getBoardContent().trim().equals("")) {
			board.setUser(user);

			boardService.insertBoard(board);

			return new ResponseDTO<>(HttpStatus.OK.value(), "글 작성이 완료되었습니다.");
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "글 작성 실패.");
	}

	// 게시글 수정
	@PutMapping("/board/updateBoard")
	public @ResponseBody ResponseDTO<?> updateBoard(@RequestBody Board board) {
		if (boardService.getBoard(board.getBoardSeq()) != null) {
			boardService.updateBoard(board);
			return new ResponseDTO<>(HttpStatus.OK.value(), "글이 수정되었습니다.");
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "현재 수정 중이거나, 수정할 수 없습니다.");
	}

	// 게시글 삭제
	@DeleteMapping("/board/deleteBoard/{boardSeq}")
	public @ResponseBody ResponseDTO<?> deleteBoard(@PathVariable int boardSeq) {
		if (boardService.getBoard(boardSeq) != null) {
			boardService.deleteBoard(boardSeq);
			return new ResponseDTO<>(HttpStatus.OK.value(), "해당 글이 삭제되었습니다. \n글번호 : " + boardSeq);
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "이미 삭제되었거나, 삭제할 수 없습니다.");
	}

	// 게시글 좋아요 증가
	@PutMapping("/board/likeUp/{boardSeq}")
	public @ResponseBody ResponseDTO<?> likeUp(@PathVariable int boardSeq, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "");
		}
		boardService.likeUp(boardSeq);
		return new ResponseDTO<>(HttpStatus.OK.value(), "");
	}

	// 게시글 싫어요 증가
	@PutMapping("/board/hateUp/{boardSeq}")
	public @ResponseBody ResponseDTO<?> hateUp(@PathVariable int boardSeq, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "");
		}
		boardService.hateUp(boardSeq);
		return new ResponseDTO<>(HttpStatus.OK.value(), "");
	}
}