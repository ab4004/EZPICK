package com.ezpick.lol.service;

import java.time.Duration;
import java.util.ArrayList;
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
import org.springframework.stereotype.Service;

import com.ezpick.lol.dto.NewsItemDTO;
import com.ezpick.lol.dto.PopularNewsItemDTO;

@Service
public class NewsService {

	// 뉴스 데이터 크롤링
	public List<NewsItemDTO> getNews() {
		WebDriver driver = initWebDriver();

		try {
			driver.get("https://game.naver.com/esports/League_of_Legends/news/lol");
			JavascriptExecutor js = (JavascriptExecutor) driver;
			js.executeScript("window.scrollTo(0, document.body.scrollHeight);"); // 페이지 끝까지 스크롤하는 코드를 추가하여 모든 이미지를 로딩
			WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // 페이지 로딩하는 시간을 주기위해 사용

			List<NewsItemDTO> newsList = new ArrayList<>(); // 크롤링한 뉴스 데이터를 리스트에 담기 위해 선언

//            List<WebElement> newsElements = driver.findElements(By.cssSelector("li.news_card_item__2lh4o"));
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
				String imageUrlStyle = newsElement.findElement(By.xpath(".//div[@class='news_card_thumbnail__3thTg']")).getAttribute("style");
				// 이미지 url의 경우 그냥 가져올 경우 제대로된 경로로 추출할 수 없기 때문에 정규식을 통해 필요한 url 부분만 추출한다.
				Pattern pattern = Pattern.compile("url\\(\"(.*?)\"");
				Matcher matcher = pattern.matcher(imageUrlStyle);
				String imageUrl = matcher.find() ? matcher.group(1) : "";

				// 기사 경로
				String linkUrl = newsElement.findElement(By.cssSelector("a")).getAttribute("href");

				// 언론사, 등록 시간
				List<WebElement> newsFooters = driver.findElements(By.cssSelector("span.news_card_source__1jv12"));
				String mediaCompany = newsFooters.get(newsCount++).getText();
				String writeTime = newsFooters.get(newsCount++).getText();

				NewsItemDTO newsItem = new NewsItemDTO(title, content, imageUrl, linkUrl, mediaCompany, writeTime);
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
	public List<PopularNewsItemDTO> getPopNews() {
		WebDriver driver = initWebDriver();

		try {
			driver.get("https://game.naver.com/esports/League_of_Legends/news/lol");

			WebDriverWait elementWait = new WebDriverWait(driver, Duration.ofSeconds(10));

	        By initialElements = By.cssSelector("#civ > div > div > div > div.news_content__T5BBG > div.news_content_right__2Wg87 > div > ol > li");
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
