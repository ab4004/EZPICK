package com.ezpick.lol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.Board;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/board/boardList")
	public String boardList() {
		return "board/boardList";
	}

	@GetMapping("/board/insertBoard")
	public String insertBoard() {
		return "board/insertBoard";
	}

	@PostMapping("/board/insertBoard")
	public @ResponseBody ResponseDTO<?> insertBoard(@RequestBody Board board) {
		if (board == null) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "작성된 내용이 없습니다."); 
		} else {
			boardService.insertBoard(board);
			return new ResponseDTO<>(HttpStatus.OK.value(), "글 작성이 완료되었습니다.");
		}
	}
}
