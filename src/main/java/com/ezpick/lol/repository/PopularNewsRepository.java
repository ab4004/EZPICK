package com.ezpick.lol.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ezpick.lol.domain.PopularNews;

public interface PopularNewsRepository extends JpaRepository<PopularNews, Integer> {

	boolean existsByTitle(String title);
	
}
