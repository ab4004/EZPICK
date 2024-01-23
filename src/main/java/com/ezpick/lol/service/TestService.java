package com.ezpick.lol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezpick.lol.domain.TestTbl;
import com.ezpick.lol.repository.TestRepository;

@Service
public class TestService {
	@Autowired
	private TestRepository testRepository;
	
	@Transactional
	public void insertData(TestTbl test) {
		testRepository.save(test);
		System.out.println("데이터 삽입 완료");
	}
}
