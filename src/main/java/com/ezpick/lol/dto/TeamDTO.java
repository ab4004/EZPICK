package com.ezpick.lol.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TeamDTO {
	private List<BanDTO> bans;
	private ObjectivesDTO objectives;
	private int teamId;
	private boolean win;
}
