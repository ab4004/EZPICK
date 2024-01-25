package com.ezpick.lol.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class ObjectivesDTO {
	private ObjectiveDTO baron;
	private ObjectiveDTO champion;
	private ObjectiveDTO dragon;
	private ObjectiveDTO inhibitor;
	private ObjectiveDTO riftHerald;
	private ObjectiveDTO tower;
}
