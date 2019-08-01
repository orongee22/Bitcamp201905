package com.bitcamp.mvc.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CookieController {
	@RequestMapping("/cookie/makeForm")
	public String getMakeForm() {
		return "cookie/makeForm";
		
	}
	
	@RequestMapping("/cookie/makeCookie")
	public String makeCookie(
			@RequestParam(value="cookieName",defaultValue="none")String cookieName,
			@RequestParam(value="cookieValue",defaultValue="none") String cookieValue,
			HttpServletResponse response
			) {
		
		// 쿠키 생성하기
		// 쿠키 생성해서 사용자한테 받은 값을 전달해서 넣어줘야함
		Cookie c = new Cookie(cookieName, cookieValue);
		response.addCookie(c);
		return "cookie/makeCookie";
	}
	
	@RequestMapping(value="/cookie/viewCookie", method=RequestMethod.GET)
	public String selectCookie() {
		return "cookie/selectForm";
	}
	
	@RequestMapping(value="/cookie/viewCookie", method=RequestMethod.POST)
	public String viewCookie(
			// CookieValue : nickname이라는 쿠키의 value값을 "cookieValue"에 넣겠다는 의미임.
			@CookieValue(value="nickname", defaultValue="none")String cookieValue, 
			@RequestParam(value="cookieName", required = false) String cookieName,
			HttpServletRequest request, Model model) {
		// 현재 생성된 쿠키 속 정보(nickname)의 값을 가져와 model 객체에 넣음..ㅣ..
		
		
		Cookie[] cookies = request.getCookies();
		
		for(int i=0;i<cookies.length;i++) {
			if(cookies[i].getName().equals(cookieName)) {
				model.addAttribute("cName",cookies[i].getName());
				model.addAttribute("cValue",cookies[i].getValue());
			}
		}
		
		return "cookie/viewCookie";
	}
}
