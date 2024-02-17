package com.ezpick.lol.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ezpick.lol.domain.News;

public interface NewsRepository extends JpaRepository<News, Integer> {

	boolean existsByTitle(String title);
	
}
