package com.bitcamp.mvc;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller // 컨트롤러 클래스임을 명시
public class HelloController {
	// ModelAndView??
	// FrontController로 전송할 view의 이름(실질적인 경로)과 결과 데이터를 저장하고 전달하는 역할.
	// Model : 결과 데이터 저장
	// View : 사용자에게 보여줄 view 객체
	@RequestMapping("/hello")
	public ModelAndView hello() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hello"); // => /WEB-INF/view/"hello".jsp
		modelAndView.addObject("userName", "Cool");
		modelAndView.addObject("greeting", "안녕하세요.");
		modelAndView.addObject("now", new Date());
		
		return modelAndView;
		// viewName & Model(추가한 Object)를 함께 반환함.
	}
	
}
