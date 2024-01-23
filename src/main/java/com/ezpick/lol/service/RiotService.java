package com.ezpick.lol.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ezpick.lol.dto.AccountDTO;
import com.ezpick.lol.dto.SummonerDTO;

/*
 * 이 클래스는 실제로 라이엇 API 서버 쪽으로 요청하고 받아오는 영역입니다.
 */

@Service
public class RiotService {
	/* 
	 * [API_KEY]
	 * 라이엇 API 서비스를 이용하기 위한 키입니다.
	 * 단 하루 24시간만 이용 가능하니 만료되었을 경우 해당 페이지(https://developer.riotgames.com/)에서 생성 또는 갱신해주세요.
	 */
	private static final String API_KEY = "RGAPI-cc2cc171-11f0-48a1-afec-f9370ba4748f";
	
	/*
	 * [NAME_TAG_URL]
	 * 소환사명, 태그라인을 포함하는 경로입니다. 아래와 같이 추가 경로를 붙여 사용 가능합니다.
	 * /riot/account/v1/accounts/by-riot-id/{gameName}/{tagLine}
	 */
	private static final String NAME_TAG_URL = "https://asia.api.riotgames.com";
	
	/*
	 * [SUMMONER_INFO_URL]
	 * puuid를 통해 소환사의 정보를 가져오는 경로입니다. 아래와 같이 추가로 붙여 사용 가능합니다.
	 * /lol/summoner/v4/summoners/by-puuid/{encryptedPUUID}
	 */
	private static final String SUMMONER_INFO_URL = "https://kr.api.riotgames.com";
	
	/*
	 * [RestTemplate]
	 * 스프링이 제공하는 HTTP 통신에 유용하게 사용 할 수 있는 템플릿입니다.
	 * getForObject() 메소드를 사용하면 서버로부터 어떤 리소스를 조회하는 기능을 구현할 수 있고, 
	 * postForLocation() 메소드를 사용하면 서버 측에 리소스를 생성하거나 수정하는 기능을 구현할 수 있습니다.
	 */
	private RestTemplate restTemplate = new RestTemplate();
	
	// 1. 소환사 명과 태그 라인으로 검색하는 메소드입니다. 자주 사용하게될 puuid를 가져옵니다.
	public AccountDTO getAccount(String gameName, String tagLine) {
		String url = NAME_TAG_URL + "/riot/account/v1/accounts/by-riot-id/" + gameName + "/" + tagLine + "?api_key=" + API_KEY;
		return restTemplate.getForObject(url, AccountDTO.class);
	}
	
	// 2. 얻어온 puuid를 통해 소환사의 추가적인 정보를 가져옵니다.
	public SummonerDTO getSummoner(String puuid) {
		String url = SUMMONER_INFO_URL + "/lol/summoner/v4/summoners/by-puuid/" + puuid + "?api_key=" + API_KEY;
		return restTemplate.getForObject(url, SummonerDTO.class);
	}
}
