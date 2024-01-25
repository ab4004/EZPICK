package com.ezpick.lol.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezpick.lol.dto.AccountDTO;
import com.ezpick.lol.dto.MatchDTO;
import com.ezpick.lol.dto.SummonerDTO;
import com.ezpick.lol.service.RiotService;


@Controller
public class SummonerController {
	
	@Autowired
	private RiotService riotService;
	
	/*
	 * 전적 조회시 순서 :
	 * 1. 매개변수로 소환사명과 태그라인을 받는다. (이 경우 태그라인을 입력하지 않을때도 고려해본다.)
	 * 2. 소환사의 정보를 불러오고 해당 정보에서 데이터를 꺼내고 집어넣어서 API 불러오고를 반복하여 원하는 데이터를 최종적으로 담는다.
	 */
	@GetMapping("/summoner")
	public String getAccount(Model model, @RequestParam String gameName, @RequestParam String tagLine) {
		if (tagLine.equals("") || tagLine == null) {
			tagLine = "KR1";
		}
		
		AccountDTO account = riotService.getAccount(gameName, tagLine); // 소환사의 계정 정보를 가져옴(puuid)
		SummonerDTO summoner = riotService.getSummoner(account.getPuuid()); // 소환사의 레벨과 같은 정보를 가져옴
//		List<ChampionMasteryDTO> championMasteryList = riotService.getChampionMastery(account.getPuuid()); // 소환사의 챔피언 숙련도 관련 정보를 가져옴
		List<String> matchHistory = riotService.getMatchHistoryList(account.getPuuid()); // 소환사의 최근 매치 기록 아이디
		List<MatchDTO> matchInfoList = riotService.getMatchInfoListAsync(matchHistory); // 매치 기록 확인용
		
		// 마지막 접속 시간 확인용
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd HH:mm");
		String date = dateFormat.format(summoner.getRevisionDate());
		
		// 소환사 주요 정보
		model.addAttribute("summoner", summoner);
		
		// api를 사용하기 위한 소환사 정보
		model.addAttribute("account", account);
		
		// 소환사의 챔피언 숙련도에 관한 정보
//		model.addAttribute("champtionMasteryList", championMasteryList);
		
		// 마지막 접속 시간 확인 정보
		model.addAttribute("date", date);
		
		// 소환사의 최근 매치 기록
		model.addAttribute("matchList", matchInfoList);
		
		return "search/summoner";
	}
	
}
