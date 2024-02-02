package com.ezpick.lol;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import io.github.bonigarcia.wdm.WebDriverManager;

@SpringBootApplication
public class EzPickTestApplication {

	public static void main(String[] args) {
		// WebDriverManager를 사용하여 ChromeDriver 설정
		WebDriverManager.chromedriver().setup();
		
		SpringApplication.run(EzPickTestApplication.class, args);
	}
}
