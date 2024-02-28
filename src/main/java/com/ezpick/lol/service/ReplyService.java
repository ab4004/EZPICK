package com.ezpick.lol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezpick.lol.domain.Board;
import com.ezpick.lol.domain.Reply;
import com.ezpick.lol.repository.ReplyRepository;

@Service
public class ReplyService {
	@Autowired
	private ReplyRepository replyRepository;

	// 게시글에 달린 하나의 댓글
	@Transactional(readOnly = true)
	public Reply getReply(int id) {
		return replyRepository.findById(id).get();
	}

	// 해당 게시글에 달린 댓글들을 모두 보여주는 리스트
	@Transactional(readOnly = true)
	public List<Reply> getReplyList(Board board) {
		return replyRepository.findByBoardOrderByLikeDesc(board);
	}

	// 댓글 작성
	@Transactional
	public void addReply(Reply reply) {
		replyRepository.save(reply);
	}

	// 댓글 삭제
	@Transactional
	public void deleteReply(int id) {
		replyRepository.deleteById(id);
	}

	// 댓글 좋아요
	@Transactional
	public void replyLikeUp(int id) {
		Reply findReply = replyRepository.findById(id).get();

		if (findReply != null)
			findReply.setLike(findReply.getLike() + 1);
	}

	// 댓글 싫어요
	@Transactional
	public void replyHateUp(int id) {
		Reply findReply = replyRepository.findById(id).get();

		if (findReply != null)
			findReply.setHate(findReply.getHate() + 1);
	}
}
