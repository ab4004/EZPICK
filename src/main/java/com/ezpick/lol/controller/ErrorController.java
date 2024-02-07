package com.ezpick.lol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	@GetMapping("/error/accessDenied")
	public String error() {
		return "error/accessDenied";
	}
}
