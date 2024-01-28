package com.ezpick.lol.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LeagueEntryDTO {
	private String leagueId;
	private String summonerId;
	private String summonerName;
	private String queueType;
	private String tier;
	private String rank;
	private String leaguePoints;
	private String wins;
	private String losses;
}
