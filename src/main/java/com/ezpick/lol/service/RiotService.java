package com.ezpick.lol.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ezpick.lol.dto.AccountDTO;
import com.ezpick.lol.dto.ChampionMasteryDTO;
import com.ezpick.lol.dto.LeagueEntryDTO;
import com.ezpick.lol.dto.MatchDTO;
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
	private static final String API_KEY = "RGAPI-a781358e-6280-4cbf-9c4f-2df1520c8090";
	
	/*
	 * [NAME_TAG_URL]
	 * 소환사명, 태그라인을 포함하는 경로입니다. 아래와 같이 추가 경로를 붙여 사용 가능합니다.
	 * /riot/account/v1/accounts/by-riot-id/{gameName}/{tagLine}
	 */
	private static final String ASIA_URL = "https://asia.api.riotgames.com";
	
	/*
	 * [SUMMONER_INFO_URL]
	 * puuid를 통해 소환사의 정보를 가져오는 경로입니다. 아래와 같이 추가로 붙여 사용 가능합니다.
	 * /lol/summoner/v4/summoners/by-puuid/{encryptedPUUID}
	 */
	private static final String KR_URL = "https://kr.api.riotgames.com";
	
	/*
	 * [RestTemplate]
	 * 스프링이 제공하는 HTTP 통신에 유용하게 사용 할 수 있는 템플릿입니다.
	 * getForObject() 메소드를 사용하면 서버로부터 어떤 리소스를 조회하는 기능을 구현할 수 있고, 
	 * postForLocation() 메소드를 사용하면 서버 측에 리소스를 생성하거나 수정하는 기능을 구현할 수 있습니다.
	 */
	private RestTemplate restTemplate = new RestTemplate();
	
	// ************ /riot/account/v1  ************
	// 소환사 명과 태그 라인으로 검색하는 메소드입니다. 자주 사용하게될 puuid를 가져옵니다.
	public AccountDTO getAccount(String gameName, String tagLine) {
		String url = ASIA_URL + "/riot/account/v1/accounts/by-riot-id/" + gameName + "/" + tagLine + "?api_key=" + API_KEY;
		return restTemplate.getForObject(url, AccountDTO.class);
	}
	
	
	// ************ /lol/summoner/v4  ************
	// -------------------------------------------
	// 얻어온 puuid를 통해 소환사의 추가적인 정보를 가져옵니다.
	public SummonerDTO getSummoner(String puuid) {
		String url = KR_URL + "/lol/summoner/v4/summoners/by-puuid/" + puuid + "?api_key=" + API_KEY;
		return restTemplate.getForObject(url, SummonerDTO.class);
	}
	
	
	// ************ /lol/champion-mastery/v4  ************
	// -------------------------------------------
	// puuid를 통해 소환사의 모스트 챔피언 숙련도 정보를 가져옵니다. (default는 3이지만 10로 설정)
	public List<ChampionMasteryDTO> getChampionMastery(String puuid) {
		String url = KR_URL + "/lol/champion-mastery/v4/champion-masteries/by-puuid/" + puuid + "/top?count=10&api_key=" + API_KEY;
		ResponseEntity<List<ChampionMasteryDTO>> responseEntity = 
				restTemplate.exchange(url, HttpMethod.GET, null, new ParameterizedTypeReference<List<ChampionMasteryDTO>>() {});
				// ParameterizedTypeReference 클래스는 매개변수가 제네릭 타입인걸 인식하여 전달하도록 하는 역할을 합니다.
		
		return responseEntity.getBody();
	}
	
	// ************ /lol/match/v5  ************
	// -------------------------------------------
	// puuid를 통해 최근 매치 기록(20번까지)을 가져옵니다(추가적인 설정으로 과거 기록도 가져올 수 있습니다.)
	public List<String> getMatchHistoryList(String puuid) {
		String url = ASIA_URL + "/lol/match/v5/matches/by-puuid/" + puuid + "/ids?start=0&count=20&api_key=" + API_KEY;
		ResponseEntity<List<String>> responseEntity = 
				restTemplate.exchange(url, HttpMethod.GET, null, new ParameterizedTypeReference<List<String>>() {});
		return responseEntity.getBody();
	}
	
	// matchid를 통해 해당 매치의 모든 정보를 가져옵니다.
	public MatchDTO getMatchInfo(String matchId) {
		String url = ASIA_URL + "/lol/match/v5/matches/" + matchId + "?api_key=" + API_KEY;
		return restTemplate.getForObject(url, MatchDTO.class);
	}
	
	// 매치 정보 관련 추가 메서드로 비동기를 위해 async 어노테이션, 한번 불러오고 빠르게 불러올수있게 cacheable 어노테이션을 사용하였습니다.
	@Async
	@Cacheable("matchInfoList")
    public List<MatchDTO> getMatchInfoListAsync(List<String> matchHistory) {
        List<MatchDTO> matchInfoList = new ArrayList<>();
        for (String matchId : matchHistory) {
            matchInfoList.add(getMatchInfo(matchId));
        }
        return matchInfoList;
    }
	
	
	// ************ /lol/league/v4  ************
	// -------------------------------------------
	// summoner_id(초반에 puuid로 가져온 id와 같음)를 통해 소환사의 랭크 정보를 가져옵니다.
	public Set<LeagueEntryDTO> getSummonerRankInfo(String id) {
		String url = KR_URL +  "/lol/league/v4/entries/by-summoner/" + id + "?api_key=" + API_KEY;
		ResponseEntity<Set<LeagueEntryDTO>> responseEntity = 
				restTemplate.exchange(url, HttpMethod.GET, null, new ParameterizedTypeReference<Set<LeagueEntryDTO>>() {});
		return responseEntity.getBody();
	}
}
