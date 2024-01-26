package com.ezpick.lol.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoDTO {
	private long gameCreation;
	private long gameDuration;
	private long gameEndTimestamp;
	private long gameId;
	
	@JsonProperty("gameMode")
	private String gameMode;
	
	private String gameName;
	private long gameStartTimestamp;
	private String gameType;
	private String gameVersion;
	private int mapId;
	private List<ParticipantDTO> participants;
	private String platformId;
	private int queueId;
	private List<TeamDTO> teams;
	private String tournamentCode;
}
