package com.ezpick.lol.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TeamDTO {
	private List<BanDTO> bans;
	
	@JsonProperty("objectives")
	private ObjectivesDTO objectives;
	
	private int teamId;
	private boolean win;
}
