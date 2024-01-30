package com.ezpick.lol.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.HttpClientErrorException;

@ControllerAdvice
public class GlobalExceptionHandler {
	// 소환사 데이터를 찾을 수 없을 경우 에러 처리
	@ExceptionHandler(HttpClientErrorException.NotFound.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handleNotFound(HttpClientErrorException.NotFound ex, Model model) {
        return "error/summonerNotFound";
	}
	
	// API가 만료되었을 경우 에러 처리
	@ExceptionHandler(HttpClientErrorException.Forbidden.class)
	@ResponseStatus(HttpStatus.FORBIDDEN)
	public String handleForbidden(HttpClientErrorException.Forbidden ex, Model model) {
        return "error/summonerForbidden";
	}
}
