package com.ezpick.lol.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DuoDTO {
	
	@NotBlank
	@Pattern(regexp = "^[a-zA-Z가-힣0-9\\s]*#?[a-zA-Z가-힣0-9\\s]*$")
	private String duoNickname;
	
	private String duoContent;
	
	private String duoPosition;
	
	private String duoGameType;
	
	private String duoTier;
}
