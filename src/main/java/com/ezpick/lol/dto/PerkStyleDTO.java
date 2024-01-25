package com.ezpick.lol.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PerkStyleDTO {
	private String description;
	private List<PerkStyleSelectionDTO> selections;
	private int style;
}
