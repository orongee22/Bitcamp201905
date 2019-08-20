package com.bitcamp.mm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 세션에서 로그인 정보가 있는 지 없는 지 확인 한 후 필터링
public class AuthCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션에 loginInfo 객체가 존재한다면 return true
		// 없다면 false => 작업 중지 / redirect-> login페이지
		
		// 현재 요청에서 세션 객체 받아오기.(false)
		HttpSession session = request.getSession(false);
		
//		if(session!=null) {
//			// 시션에서 loginInfo 받아오기.
//			Object auth = session.getAttribute("loginInfo");
//			if(auth != null) {
//				return true;
//			}
//		}
		
		if(session!=null && session.getAttribute("loginInfo")!=null) {
			return true;
		}
			
		response.sendRedirect(request.getContextPath()+"/member/login");
		return false;
	}

}
