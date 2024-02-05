package com.ezpick.lol.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PopularNewsItemDTO {
	private String title;
	private String imageUrl;
	private String linkUrl;
}
