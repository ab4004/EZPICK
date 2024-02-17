package com.ezpick.lol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezpick.lol.domain.News;
import com.ezpick.lol.domain.PopularNews;
import com.ezpick.lol.service.NewsService;


@Controller
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	@GetMapping("/news")
	public String getNews(@RequestParam(defaultValue = "0") int page, Model model) {
		Pageable pageable = PageRequest.of(page, 10, Sort.by("id").descending());
		Page<News> newsPage = newsService.getNewsList(pageable);
		List<News> newsList = newsPage.getContent();
		
		Pageable popPageable = PageRequest.of(0, 12, Sort.by("id").descending());
		Page<PopularNews> popNewsPage = newsService.getPopNewsList(popPageable);
        List<PopularNews> popNewsList = popNewsPage.getContent();
        
        // 크롤링을 통한 뉴스 모델
        model.addAttribute("newsList", newsList);
        model.addAttribute("popNewsList", popNewsList);
        model.addAttribute("currentPage", newsPage.getNumber());
        model.addAttribute("totalPages", newsPage.getTotalPages());
        
        return "news/lolNews";
	}
}
