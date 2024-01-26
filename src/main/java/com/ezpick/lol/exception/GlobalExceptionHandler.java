package com.ezpick.lol.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.HttpClientErrorException;

@ControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(HttpClientErrorException.NotFound.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handleNotFound(HttpClientErrorException.NotFound ex, Model model) {
        return "error/summonerNotFound";
	}
}