package com.bitcamp.mm.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.mm.member.domain.MemberInfo;

@Controller
public class ExceptionTestController {
	@RequestMapping("/test")
	public String page() {
		MemberInfo memberInfo= null;
		
		System.out.println(memberInfo.getIdx());
		return "main";
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String HandlerNullPointException(NullPointerException ne) {
		return "error/nullException";
	}
}
