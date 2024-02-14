package com.ezpick.lol.controller;

import java.util.List;

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
	public String duoList(@RequestParam(required = false) String gameType, @RequestParam(required = false) String tier,
			@RequestParam(required = false) String position, Model model) {
		List<Duo> duoList = null;
		if ((gameType == null || gameType.isEmpty()) && (tier == null || tier.isEmpty())
				&& (position == null || position.isEmpty())) {
			duoList = duoService.duoList();
		} else if ((tier == null || tier.isEmpty()) && (position == null || position.isEmpty())) {
			duoList = duoService.selectGameType(gameType);
		} else if ((gameType == null || gameType.isEmpty()) && (position == null || position.isEmpty())) {
			duoList = duoService.selectTier(tier);
		} else if ((gameType == null || gameType.isEmpty()) && (tier == null || tier.isEmpty())) {
			duoList = duoService.selectPosition(position);
		} else if ((position == null || position.isEmpty())) {
			duoList = duoService.positionNull(gameType, tier);
		} else if ((tier == null || tier.isEmpty())) {
			duoList = duoService.tierNull(gameType, position);
		} else if ((gameType == null || gameType.isEmpty())) {
			duoList = duoService.gameTypeNull(tier, position);
		} else {
			duoList = duoService.searchDuo(gameType, tier, position);
		}
		model.addAttribute("duoList", duoList);
		return "duo/duoList";
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
