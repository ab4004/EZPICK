package com.ezpick.lol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	// 패치노트에 관한 내용(패치노트 제목, 이미지, 링크)을 해당 컨트롤러에서 수정
	private final static String patch_title = "14.3 패치노트";
	private final static String patch_image = "https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt369a779b76843fd5/65c1f62a0872228f8e495383/LOL_14.3_Patch-Highlights_TW_1920x1080_KR.png";
	private final static String patch_link = "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-14-3-notes/";
	
	@GetMapping({"", "/"})
	public String getHome(Model model) {
		
		model.addAttribute("patch_title", patch_title);
		model.addAttribute("patch_image", patch_image);
		model.addAttribute("patch_link", patch_link);
		
		return "index";
	}
	
}
