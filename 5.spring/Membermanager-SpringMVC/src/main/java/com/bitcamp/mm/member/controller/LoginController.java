package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.member.service.MemberLoginService;

@Controller
@RequestMapping("member/login")
public class LoginController {
	@Autowired
	private MemberLoginService loginService;
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginform(HttpServletRequest request) {
		// 현재 세션이 있다면 그 세션 객체를 받아오고, 세션이 없다면 null값을 받는다.
		// 새로운 세션 가져오기 : true
		// 기존 세션 가져오기 : false
		String view = "member/loginForm";
		HttpSession session = request.getSession(false);
		if(session !=null && session.getAttribute("loginInfo") != null) {
			view = "redirect:/main";
		} 
		return view;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String login(
			@RequestParam("uId") String id,
			@RequestParam("uPW") String pw,
			HttpServletRequest request
			) {
		String view = "member/loginFail";
		
		boolean loginChk = loginService.login(id, pw, request);
		
		if(loginChk) {
			view = "redirect:/main";
		}
		
		return view;
		
	}
}
