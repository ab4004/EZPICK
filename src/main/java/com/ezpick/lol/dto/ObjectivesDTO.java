package com.ezpick.lol.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ObjectivesDTO {
	private ObjectiveDTO baron;
	private ObjectiveDTO champion;
	private ObjectiveDTO dragon;
	private ObjectiveDTO inhibitor;
	private ObjectiveDTO riftHerald;
	private ObjectiveDTO tower;
}
