package com.ezpick.lol.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Service;

import com.ezpick.lol.dto.NewsItemDTO;

@Service
public class NewsService {
	
	public List<NewsItemDTO> getNews() {

        try {
        	// 크롬 드라이버를 사용하고, 크롤링할 웹 페이지를 드라이버로 가져옴
        	ChromeOptions options = new ChromeOptions();
            options.addArguments("--disable-blink-features=AutomationControlled", "--headless");
            WebDriver driver = new ChromeDriver(options);
            driver.get("https://game.naver.com/esports/League_of_Legends/news/lol");
            
            Thread.sleep(2500);

            List<NewsItemDTO> newsList = new ArrayList<>(); // 크롤링한 뉴스 데이터를 리스트에 담아둠
            
            List<WebElement> newsElements = driver.findElements(By.cssSelector("li.news_card_item__2lh4o"));
            
            for (WebElement newsElement : newsElements) {
            	String title = newsElement.findElement(By.cssSelector("strong.news_card_title__1fVVk")).getText();
            	String content = newsElement.findElement(By.cssSelector("p.news_card_subcontent__23_y1")).getText();
            	
            	// 이미지 url의 경우 그냥 가져올 경우 제대로된 경로로 추출할 수 없기 때문에 정규식을 통해 필요한 url 부분만 추출한다. 
//            	String styleAttr = newsElement.findElement(By.cssSelector("div.news_card_thumbnail__3thTg")).getAttribute("style");
//            	Pattern pattern = Pattern.compile("url\\(\"(.+?)\"\\)");
//            	Matcher matcher = pattern.matcher(styleAttr);
//            	String imageUrl = matcher.find() ? matcher.group(1) : null;
            	String imageUrl = newsElement.findElement(By.xpath("//div[@class='news_card_thumbnail__3thTg']")).getAttribute("style");
            	
            	String linkUrl = newsElement.findElement(By.cssSelector("a")).getAttribute("href");
            	
            	NewsItemDTO newsItem = new NewsItemDTO(title, content, imageUrl, linkUrl);
            	newsList.add(newsItem);
            }
            
            driver.quit();
            
            return newsList;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
	}
}
