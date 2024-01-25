package com.ezpick.lol.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchDTO {
	@JsonProperty("metadata")
	private MetadataDTO metadata;
	
	@JsonProperty("info")
	private InfoDTO info;
}
