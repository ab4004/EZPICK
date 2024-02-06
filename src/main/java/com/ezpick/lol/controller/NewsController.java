package com.ezpick.lol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezpick.lol.dto.NewsItemDTO;
import com.ezpick.lol.dto.PopularNewsItemDTO;
import com.ezpick.lol.service.NewsService;


@Controller
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	@GetMapping("/news")
	public String getNews(Model model) {
        List<NewsItemDTO> newsList = newsService.getNews();
        List<PopularNewsItemDTO> popNewsList = newsService.getPopNews();
        
        // 크롤링을 통한 뉴스 모델
        model.addAttribute("newsList", newsList);
        model.addAttribute("popNewsList", popNewsList);
        
        return "news/lolNews";
	}
	
}
