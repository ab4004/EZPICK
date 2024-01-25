package com.ezpick.lol.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChampionMasteryDTO {
	private String puuid; // 플레이어 고유 식별자
	private long championPointsUntilNextLevel; // 해당 챔피언 레벨업까지 필요한 포인트 수(MAX = 0)
	private boolean chestGranted; // 이번 시즌 해당 챔피언 상자 여부
	private long championId; // 챔피언 아이디
	private long lastPlayTime; // 해당 챔피언 마지막 플레이 시간
	private int championLevel; // 챔피언 레벨
	private String summonerId; // 암호화된 소환사의 아이디
	private int championPoints; // 챔피언 레벨 결정하는 포인트
	private long championPointsSinceLastLevel; // 마지막에 획득한 포인트
	private int tokensEarned; // 챔피언에 대해 획득한 토큰 수
}
