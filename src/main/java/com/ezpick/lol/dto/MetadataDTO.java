package com.ezpick.lol.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MetadataDTO {
	private String dataVersion;
	
	@JsonProperty("matchId")
	private String matchId;
	
	private List<String> participants;
}
