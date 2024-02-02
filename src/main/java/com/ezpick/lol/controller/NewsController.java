package com.ezpick.lol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezpick.lol.dto.NewsItemDTO;
import com.ezpick.lol.service.NewsService;


@Controller
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	@GetMapping("/news")
	public String getNews(Model model) {
        List<NewsItemDTO> newsList = newsService.getNews();
        
        for (NewsItemDTO news : newsList) {
        	System.out.println(news.getImageUrl());
        }
        
        // 크롤링 결과를 모델에 추가
        model.addAttribute("newsList", newsList);
        
        return "news/lolNews";
	}
	
}
