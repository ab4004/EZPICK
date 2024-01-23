package com.ezpick.lol.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ezpick.lol.domain.TestTbl;

public interface TestRepository extends JpaRepository<TestTbl, Integer> {
	
}
