package com.ezpick.lol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezpick.lol.domain.Reply;
import com.ezpick.lol.domain.User;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.service.BoardService;
import com.ezpick.lol.service.ReplyService;

import jakarta.servlet.http.HttpSession;

@RestController
public class ReplyController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	// 댓글 추가
	@PostMapping("/addReply/{board_id}")
	public ResponseDTO<?> addReply(@PathVariable int board_id, Reply reply, HttpSession session) {
		if (session.getAttribute("user") != null) {
			reply.setBoard(boardService.getBoard(board_id));
			reply.setUser((User) session.getAttribute("user"));
			replyService.addReply(reply);
			return new ResponseDTO<>(HttpStatus.OK.value(), "댓글이 등록되었습니다.");
		}

		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "로그인이 필요합니다.");
	}

	// 댓글 수정
	@PutMapping("/updateReply")
	public ResponseDTO<?> updateReply(Reply reply, HttpSession session) {
		User user = (User) session.getAttribute("user");

		if (user != null) {
			Reply findReply = replyService.getReply(reply.getId());

			if (findReply != null) {
				findReply.setContent(reply.getContent());
				replyService.updateReply(findReply);
				return new ResponseDTO<>(HttpStatus.OK.value(), "댓글이 수정되었습니다.");
			}

			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "작성자가 다릅니다.");
		}

		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "로그인이 필요합니다.");
	}

	// 댓글 삭제
	@DeleteMapping("/deleteReply/{id}")
	public ResponseDTO<?> deleteReply(@PathVariable int id, HttpSession session) {
		if (session.getAttribute("user") != null) {
			if (replyService.getReply(id) != null) {
				replyService.deleteReply(id);
				return new ResponseDTO<>(HttpStatus.OK.value(), "댓글이 삭제되었습니다.");
			}

			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "작성자가 다릅니다.");
		}

		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "로그인이 필요합니다.");
	}

	// 댓글 좋아요
	@PutMapping("replyLike/{id}")
	public ResponseDTO<?> replyLikeUp(@PathVariable int id, HttpSession session) {
		User user = (User)session.getAttribute("user");
		if (user != null) {
			if (replyService.getReply(id) != null) {
				replyService.replyLikeUp(id);
				return new ResponseDTO<>(HttpStatus.OK.value(), "좋아요 증가");
			}

			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "댓글을 찾을 수 없습니다.");
		}

		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "로그인이 필요합니다.");
	}

	// 댓글 싫어요
	@PutMapping("replyHate/{id}")
	public ResponseDTO<?> replyHateUp(@PathVariable int id, HttpSession session) {
		if (session.getAttribute("user") != null) {
			if (replyService.getReply(id) != null) {
				replyService.replyHateUp(id);
				return new ResponseDTO<>(HttpStatus.OK.value(), "싫어요 증가");
			}

			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "댓글을 찾을 수 없습니다.");
		}

		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "로그인이 필요합니다.");
	}
}
