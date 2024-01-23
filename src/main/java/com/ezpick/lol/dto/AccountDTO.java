package com.ezpick.lol.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 소환사 명과 태그라인으로 검색시 반환하는 객체
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountDTO {
	private String puuid;
	private String gameName;
	private String tagLine;
}
