package com.ezpick.lol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DisignTestController {
	
	@GetMapping({"", "/"})
	public String getJSP() {
		return "index";
	}
	
}