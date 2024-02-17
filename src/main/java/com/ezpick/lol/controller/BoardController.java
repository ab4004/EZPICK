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

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/board")
	public String getBoardList(Model model, @RequestParam(defaultValue = "0") int page) {
		Pageable pageable = PageRequest.of(page, 10, Sort.by("boardSeq").descending());
		Page<Board> boardPage = boardService.getBoardList(pageable);
		List<Board> boardList = boardPage.getContent();
		model.addAttribute("boardList", boardList);
		model.addAttribute("currentNumber", boardPage.getNumber());
		model.addAttribute("totalPages", boardPage.getTotalPages());
		return "board/boardList";
	}

	@GetMapping("/board/insertBoard")
	public String insertBoard() {
		return "board/insertBoard";
	}

	@GetMapping("/board/detail/{boardSeq}")
	public String getBoard(@PathVariable int boardSeq, Model model) {
		model.addAttribute("board", boardService.getBoard(boardSeq));
		return "board/getBoard";
	}

	@GetMapping("/board/updateBoard/{boardSeq}")
	public String updateBoard(@PathVariable int boardSeq, Model model) {
		model.addAttribute("board", boardService.getBoard(boardSeq));
		return "board/updateBoard";
	}
	
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

	@PutMapping("/board/updateBoard")
	public @ResponseBody ResponseDTO<?> updateBoard(@RequestBody Board board) {
		boardService.updateBoard(board);
		return new ResponseDTO<>(HttpStatus.OK.value(), board.getBoardSeq() + " 뭘 수정함?");
	}

	@DeleteMapping("/board/deleteBoard/{boardSeq}")
	public @ResponseBody ResponseDTO<?> deleteBoard(@PathVariable int boardSeq) {
		boardService.deleteBoard(boardSeq);
		return new ResponseDTO<>(HttpStatus.OK.value(), boardSeq + "뭐가 삭제됨??");
	}
}