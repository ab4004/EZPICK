package com.ezpick.lol.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PerksDTO {
	private PerkStatsDTO statPerks;
	private List<PerkStyleDTO> styles;
}
