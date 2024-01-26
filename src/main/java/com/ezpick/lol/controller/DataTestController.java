package com.ezpick.lol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezpick.lol.domain.TestTbl;
import com.ezpick.lol.service.TestService;

@Controller
public class DataTestController {
	
	@Autowired
	private TestService testService;
	
	@GetMapping("/test")
	public String test() {
		return "test";
	}
	
	@PostMapping("/test")
	public void insertData() {
		TestTbl test = new TestTbl();
		test.setContent("test");
		testService.insertData(test);
	}
}
