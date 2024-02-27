package com.ezpick.lol.service;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezpick.lol.domain.News;
import com.ezpick.lol.domain.PopularNews;
import com.ezpick.lol.dto.NewsItemDTO;
import com.ezpick.lol.dto.PopularNewsItemDTO;
import com.ezpick.lol.repository.NewsRepository;
import com.ezpick.lol.repository.PopularNewsRepository;

import jakarta.annotation.PostConstruct;

@Service
public class NewsService {

	@Autowired
	private NewsRepository newsRepository;

	@Autowired
	private PopularNewsRepository popularNewsRepository;

	// 크롤링한 뉴스데이터를 DB에 저장하는 메소드
	@PostConstruct // 첫 실행 시 크롤링 실행
	@Scheduled(fixedDelay = 600000) // 10분 마다 갱신
	@Transactional
	public void saveNewsData() {
		List<NewsItemDTO> newsList = getNews();
		Collections.reverse(newsList);

		for (NewsItemDTO news : newsList) {
			if (!isNewsExist(news)) {
				News entity = new News();
				entity.setTitle(news.getTitle());
				entity.setContent(news.getContent());
				entity.setImageUrl(news.getImageUrl());
				entity.setLinkUrl(news.getLinkUrl());
				entity.setMediaCompany(news.getMediaCompany());

				newsRepository.save(entity);
			}
		}

		List<PopularNewsItemDTO> popNewsList = getPopNews();
		Collections.reverse(popNewsList);
		
		for (PopularNewsItemDTO news : popNewsList) {
			if (!isPopularNewsExist(news)) {
				PopularNews entity = new PopularNews();
				entity.setTitle(news.getTitle());
				entity.setImageUrl(news.getImageUrl());
				entity.setLinkUrl(news.getLinkUrl());

				popularNewsRepository.save(entity);
			}
		}
	}
	
	// 데이터베이스에 저장된 뉴스 기사를 반환하는 메소드
	@Transactional(readOnly = true)
	public Page<News> getNewsList(Pageable pageable) {
		return newsRepository.findAll(pageable);
	}
	
	// 데이터베이스에 저장된 인기 뉴스 기사를 반환하는 메소드
	@Transactional(readOnly = true)
	public Page<PopularNews> getPopNewsList(Pageable pageable) {
		return popularNewsRepository.findAll(pageable);
	}


	// 뉴스 기사가 이미 데이터베이스에 존재하는지 확인하는 메소드
	@Transactional
	private boolean isNewsExist(NewsItemDTO newsItem) {
		return newsRepository.existsByTitle(newsItem.getTitle());
	}

	// 인기 뉴스 기사가 이미 데이터베이스에 존재하는지 확인하는 메소드
	@Transactional
	private boolean isPopularNewsExist(PopularNewsItemDTO popNewsItem) {
		return popularNewsRepository.existsByTitle(popNewsItem.getTitle());
	}

	/*-----------------------------------------------------------------------
	 * 아래부터 웹 사이트 크롤링할 때 사용하는 메소드들
	 * 1. getNews 메소드 - 기본적인 e스포츠 뉴스를 크롤링
	 * 2. getPopNews 메소드 - 사람들이 많이 본 뉴스를 크롤링
	 * 3. initWebDriver 메소드 - Selenium으로 웹 크롤링을 하기위한 드라이버 설정
	 */

	// 뉴스 데이터 크롤링
	private List<NewsItemDTO> getNews() {
		WebDriver driver = initWebDriver();

		try {
			driver.get("https://game.naver.com/esports/League_of_Legends/news/lol");
			JavascriptExecutor js = (JavascriptExecutor) driver;
			js.executeScript("window.scrollTo(0, document.body.scrollHeight);"); // 페이지 끝까지 스크롤하는 코드를 추가하여 모든 이미지를 로딩
			WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // 페이지 로딩하는 시간을 주기위해 사용

			List<NewsItemDTO> newsList = new ArrayList<>(); // 크롤링한 뉴스 데이터를 리스트에 담기 위해 선언

			By cards = By.cssSelector("li.news_card_item__2lh4o");
			wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(cards));
			List<WebElement> newsElements = driver.findElements(cards);

			int newsCount = 0;

			for (WebElement newsElement : newsElements) {
				// 기사 제목
				String title = newsElement.findElement(By.cssSelector("strong.news_card_title__1fVVk")).getText();

				// 기사 컨텐츠
				String content = newsElement.findElement(By.cssSelector("p.news_card_subcontent__23_y1")).getText();

				// 기사 섬네일
				String imageUrlStyle = newsElement.findElement(By.xpath(".//div[@class='news_card_thumbnail__3thTg']"))
						.getAttribute("style");
				// 이미지 url의 경우 그냥 가져올 경우 제대로된 경로로 추출할 수 없기 때문에 정규식을 통해 필요한 url 부분만 추출한다.
				Pattern pattern = Pattern.compile("url\\(\"(.*?)\"");
				Matcher matcher = pattern.matcher(imageUrlStyle);
				String imageUrl = matcher.find() ? matcher.group(1) : "";

				// 기사 경로
				String linkUrl = newsElement.findElement(By.cssSelector("a")).getAttribute("href");

				// 언론사
				List<WebElement> newsFooters = driver.findElements(By.cssSelector("span.news_card_source__1jv12"));
				String mediaCompany = newsFooters.get(newsCount++).getText();
				newsCount++; // 실제로 언론사 다음 시간이 담기는 부분 스킵(시간은 DB에 담길 때 고정되서 필요없음)

				NewsItemDTO newsItem = new NewsItemDTO(title, content, imageUrl, linkUrl, mediaCompany);
				newsList.add(newsItem);
			}

			driver.quit();

			return newsList;
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
	}

	// 인기 뉴스 리스트를 가져오는 메소드
	private List<PopularNewsItemDTO> getPopNews() {
		WebDriver driver = initWebDriver();

		try {
			driver.get("https://game.naver.com/esports/League_of_Legends/news/lol");

			WebDriverWait elementWait = new WebDriverWait(driver, Duration.ofSeconds(10));

			By initialElements = By.cssSelector(
					"#civ > div > div > div > div.news_content__T5BBG > div.news_content_right__2Wg87 > div > ol > li");
			elementWait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(initialElements));

			JavascriptExecutor js = (JavascriptExecutor) driver;
			js.executeScript("return document.readyState").equals("complete");

			List<WebElement> popNewsElements = driver.findElements(initialElements);

			if (popNewsElements.isEmpty()) { // 비었으면 한번더 데이터 스크롤
				js.executeScript("window.scrollTo(0, document.body.scrollHeight);");
				elementWait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(initialElements));
				popNewsElements = driver.findElements(initialElements);
			}

			List<PopularNewsItemDTO> popNewsList = new ArrayList<>();

			for (WebElement popNewsElement : popNewsElements) {
				String title = popNewsElement.findElement(By.cssSelector("strong.news_mostview_title__1w7v_"))
						.getText();

				String imageUrlStyle = popNewsElement
						.findElement(By.xpath(".//div[@class='news_mostview_thumbnail_area__3ee4I']"))
						.getAttribute("style");
				Pattern pattern = Pattern.compile("url\\(\"(.*?)\"");
				Matcher matcher = pattern.matcher(imageUrlStyle);
				String imageUrl = matcher.find() ? matcher.group(1) : "";

				String linkUrl = popNewsElement.findElement(By.cssSelector("a")).getAttribute("href");

				PopularNewsItemDTO popNewsItem = new PopularNewsItemDTO(title, imageUrl, linkUrl);
				popNewsList.add(popNewsItem);
			}

			driver.quit();

			return popNewsList;
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
	}

	// WebDriver 초기화 및 설정 (ChromeDriver를 사용할 경우)
	private WebDriver initWebDriver() {
		// 크롬 드라이버를 사용하고, 크롤링할 웹 페이지를 드라이버로 가져옴
		ChromeOptions options = new ChromeOptions(); // 원래 기본으로 실행하면 웹 스크래핑 동안 브라우저가 뜨는데 옵션 설정을 통해 백그라운드로 데이터를 가져올 수 있도록 설정
		options.addArguments("--headless");
		options.addArguments("--disable-gpu");
		options.addArguments("--window-size=1920,1080");
		options.addArguments("--disable-popup-blocking");
		ChromeDriver driver = new ChromeDriver(options);
		return driver;
	}
}
