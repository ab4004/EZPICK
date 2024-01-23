package com.ezpick.lol.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SummonerDTO {
	private String accountId;
	private int profileIconId;
	private long revisionDate;
	private String name;
	private String id;
	private String puuid;
	private long summonerLevel;
}

/*
 * 라이엇 API 서버 응답을 받을 경우 자바로 받게되는 객체 클래스 입니다.
 */