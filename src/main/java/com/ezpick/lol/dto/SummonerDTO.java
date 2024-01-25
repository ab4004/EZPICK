package com.ezpick.lol.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SummonerDTO {
	private String accountId; // 암호화된 계정 아이디
	private int profileIconId; // 소환사 사용중 아이콘
	private long revisionDate; // 최근 게임시간(ms) - 맨뒤 3자리를 지우고 표준시 +9를 해주면 최근 게임시간이 나옴
	private String name; // 계정 이름(이전 이름으로 사용가능)
	private String id; // 암호화된 소환사 아이디
	private String puuid; // puuid
	private long summonerLevel; // 소환사 레벨
}