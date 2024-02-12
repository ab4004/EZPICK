package com.ezpick.lol.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.Duo;
import com.ezpick.lol.dto.DuoDTO;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.service.DuoService;

import jakarta.validation.Valid;

@Controller
public class DuoController {

	@Autowired
	private DuoService duoService;

	@Autowired
	private ModelMapper modelMapper;

	@GetMapping("/duo/duoList")
	public String duoList(Model model) {
		model.addAttribute("duoList", duoService.duoList());
		return "duo/duoList";
	}

	/*@GetMapping("/duo/searchDuo")
	public String searchDuo(@RequestParam String gameType, @RequestParam String tier, @RequestParam String position,
			Model model) {
		System.out.println(gameType + tier + position);
		model.addAttribute("searchDuo", duoService.serchDuo(gameType, tier, position));
		return "duo/searchDuo";
	}*/
	
	/*@GetMapping("/duo/searchDuo")
	public @ResponseBody ResponseDTO<?> searchDuo(@RequestParam String gameType, @RequestParam String tier, @RequestParam String position,
			Model model) {
		model.addAttribute("searchDuo", duoService.serchDuo(gameType, tier, position));
		return new ResponseDTO<>(HttpStatus.OK.value(), "");
	}*/
	
	@GetMapping("/duo/searchDuo")
	public String searchDuo(@RequestParam String gameType, @RequestParam String tier, @RequestParam String position,
			Model model) {
		model.addAttribute("searchDuo", duoService.serchDuo(gameType, tier, position));
		return "duo/searchDuo";
	}
	

	@PostMapping("/duo/insertDuo")
	public @ResponseBody ResponseDTO<?> insertDuo(@Valid @RequestBody DuoDTO duoDTO, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "입력하신 내용을 다시 확인해주세요.");
		}
		Duo duoEntity = modelMapper.map(duoDTO, Duo.class);
		duoService.insertDuo(duoEntity);

		return new ResponseDTO<>(HttpStatus.OK.value(), "글 작성이 완료되었습니다.");
	}
}
