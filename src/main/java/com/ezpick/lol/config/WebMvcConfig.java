package com.ezpick.lol.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ezpick.lol.interceptor.LoggerInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoggerInterceptor())
			.excludePathPatterns("/css/**", "/img/**", "/js/**", "/board")
			.addPathPatterns("/auth/myPage", "/admin/**", "/board/**");
	}
}
