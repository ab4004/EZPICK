package com.ezpick.lol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.Duo;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.service.DuoService;

@Controller
public class DuoController {

	@Autowired
	private DuoService duoService;

	@GetMapping("/duo/duoList")
	public String duoList(Model model) {
		model.addAttribute("duoList", duoService.duoList());
		return "duo/duoList";
	}

	@PostMapping("/duo/findDuo")
	public @ResponseBody ResponseDTO<?> findDuo(@RequestBody Duo duo) {
		if (duo == null) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "작성된 내용이 없습니다.");
		} else {
			duoService.findDuo(duo);
			return new ResponseDTO<>(HttpStatus.OK.value(), "글 작성이 완료되었습니다.");
		}
	}
}
