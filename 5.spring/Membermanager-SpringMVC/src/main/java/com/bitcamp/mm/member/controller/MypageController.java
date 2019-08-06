package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	@RequestMapping("member/mypage")
	public String myPage(HttpSession session) {
		String view = "member/mypage";
		
		System.out.println("session : "+session);
		if(session == null || session.getAttribute("loginInfo") == null) {
			
			view = "redirect:/member/login";
		}
		
		return view;
	}
}
