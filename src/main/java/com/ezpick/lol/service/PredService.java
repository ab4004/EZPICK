package com.ezpick.lol.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezpick.lol.domain.Book;
import com.ezpick.lol.domain.Pdb;
import com.ezpick.lol.domain.User;
import com.ezpick.lol.repository.BookRepository;
import com.ezpick.lol.repository.PdbRepository;

@Service
public class PredService {

	@Autowired
	private PdbRepository pdbRepository;

	@Autowired
	private BookRepository bookRepository;

	// 홈 팀 승리 예측 버튼 클릭 시 DB에 저장
	@Transactional
	public void pickHome(Pdb pdb) {

		pdbRepository.save(pdb);

	}

	// 원정 팀 승리 예측 버튼 클릭 시 DB에 저장
	@Transactional
	public void pickAway(Pdb pdb) {

		pdbRepository.save(pdb);

	}

	// 경기 일정(Book)을 가져와서 주차의 시작 날짜와 마지막 날짜를 기준으로 리스트 가져오기
	@Transactional(readOnly = true)
	public List<Book> date(LocalDateTime startDate, LocalDateTime endDate) {

		// int monthValue = date.getMonthValue();
		List<Book> preds = bookRepository.findAllByDateBetween(startDate, endDate, Sort.by(Direction.ASC, "date"));

		return preds.stream()
				// .filter(pred -> pred.getDate().getMonthValue() == monthValue)
				.collect(Collectors.toList());
	}

	// Pdb 에서 UserId & Book 기준으로 리스트 조회
	@Transactional(readOnly = true)
	public List<Pdb> getPdbByUserIdAndBook(User userId, Book book) {

		List<Pdb> findPdb = pdbRepository.findByUserIdAndBook(userId, book);

		return findPdb;
	}

	// 적중 순위 별 리스트
	@Transactional(readOnly = true)
	public List<Object[]> createRank() {

		List<Object[]> result = pdbRepository.findUserIdAndTotalHits();
		return result;
	}

	// 데이터 수정시 전체 pdb의 hits 수정
	@Transactional
	public void updateHits() {
		pdbRepository.updateHits();
	}
	
	@Transactional(readOnly = true)
	public List<Object[]> pickList(String userId) {
		return pdbRepository.pickList(userId);
	}
}
