package com.ezpick.lol.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class ParticipantDTO {
	private int allInPings;
	private int assistMePings;
	private int assists;
	private int baronKills;
	private int basicPings;
	private int bountyLevel;
	private int champExperience;
	private int champLevel;
	private int championId;
	private String championName;
	private int championTransform;
	private int consumablesPurchased;
	private int damageDealtToBuildings;
	private int damageDealtToObjectives;
	private int damageDealtToTurrets;
	private int damageSelfMitigated;
	private int deaths;
	private int detectorWardsPlaced;
	private int doubleKills;
	private int dragonKills;
	private boolean firstBloodAssist;
	private boolean firstBloodKill;
	private boolean firstTowerAssist;
	private boolean firstTowerKill;
	private boolean gameEndedInEarlySurrender;
	private boolean gameEndedInSurrender;
	private int goldEarned;
	private int goldSpent;
	private String individualPosition;
	private int inhibitorKills;
	private int inhibitorTakedowns;
	private int inhibitorsLost;
	private int item0;
	private int item1;
	private int item2;
	private int item3;
	private int item4;
	private int item5;
	private int item6;
	private int itemsPurchased;
	
	@JsonProperty("kda")
	private long kda;
	
	private int killingSprees;
	private int kills;
	private String lane;
	private int largestCriticalStrike;
	private int largestKillingSpree;
	private int largestMultiKill;
	private int longestTimeSpentLiving;
	private int magicDamageDealt;
	private int magicDamageDealtToChampions;
	private int magicDamageTaken;
	private int neutralMinionsKilled;
	private int nexusKills;
	private int nexusTakedowns;
	private int nexusLost;
	private int objectivesStolen;
	private int objectivesStolenAssists;
	private int participantId;
	private int pentaKills;
	
	@JsonProperty("perks")
	private PerksDTO perks;
	
	private int physicalDamageDealt;
	private int physicalDamageDealtToChampions;
	private int physicalDamageTaken;
	private int profileIcon;
	private String puuid;
	private int quadraKills;
	
	@JsonProperty("riotIdGameName")
	private String riotIdGameName; // riotIdName에서 riotIdGameName으로 변경됨(23.11월)
	
	private String riotIdTagline;
	private String role;
	private int sightWardsBoughtInGame;
	private int spell1Casts;
	private int spell2Casts;
	private int spell3Casts;
	private int spell4Casts;
	private int summoner1Casts;
	
	@JsonProperty("summoner1Id")
	private int summoner1Id;
	
	private int summoner2Casts;
	
	@JsonProperty("summoner2Id")
	private int summoner2Id;
	
	private String summonerId;
	private int summonerLevel;
	private String summonerName;
	private boolean teamEarlySurrendered;
	private int teamId;
	private String teamPosition;
	private int timeCCingOthers;
	private int timePlayed;
	private int totalDamageDealt;
	private int totalDamageDealtToChampions;
	private int totalDamageShieldedOnTeammates;
	private int totalDamageTaken;
	private int totalHeal;
	private int totalHealsOnTeammates;
	private int totalMinionsKilled;
	private int totalTimeCCDealt;
	private int totalTimeSpentDead;
	private int totalUnitsHealed;
	private int tripleKills;
	private int trueDamageDealt;
	private int trueDamageDealtToChampions;
	private int trueDamageTaken;
	private int turretKills;
	private int turretTakedowns;
	private int turretsLost;
	private int unrealKills;
	private int visionScore;
	private int visionWardsBoughtInGame;
	private int wardsKilled;
	private int wardsPlaced;
	private boolean win;
}
