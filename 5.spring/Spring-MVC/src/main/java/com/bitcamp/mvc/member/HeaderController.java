package com.bitcamp.mvc.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HeaderController {
	@RequestMapping("/header/getHeader")
	// 바로 직전에 머물고 있던 링크 주소를 반환함. - referer
	// requestheader - request의 정보값을 반환하는 어노테이션
	public String getHeader(@RequestHeader("referer") String referer,Model model) {
		System.out.println(referer);
		
		model.addAttribute("result", referer);
		return "header/header";
	}
}
