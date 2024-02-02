package com.ezpick.lol.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NewsItemDTO {
	private String title;
	private String content;
	private String imageUrl;
	private String linkUrl;
}
