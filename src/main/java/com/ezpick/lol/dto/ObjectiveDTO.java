package com.ezpick.lol.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ObjectiveDTO {
	private boolean first;
	
	@JsonProperty("kills")
	private int kills;
}
