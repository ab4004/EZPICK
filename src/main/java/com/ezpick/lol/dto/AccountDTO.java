package com.ezpick.lol.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 소환사 명과 태그라인으로 검색시 반환하는 객체
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountDTO {
	private String puuid; // 유저의 puuid
	private String gameName; // 소환사 명
	private String tagLine; // 태그
}
