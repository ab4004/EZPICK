package com.ezpick.lol.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MetadataDTO {
	private String dataVersion;
	private String matchId;
	private List<String> participants;
}
