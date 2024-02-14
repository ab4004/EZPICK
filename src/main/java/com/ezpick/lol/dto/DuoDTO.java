package com.ezpick.lol.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DuoDTO {
	
	@NotBlank
	private String duoNickname;
	
	@Size(max = 80)
	private String duoContent;
	
	@NotBlank
	private String duoPosition;
	
	private String duoGameType;
	
	private String duoTier;
}
