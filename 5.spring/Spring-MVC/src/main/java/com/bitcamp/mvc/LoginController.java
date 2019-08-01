package com.bitcamp.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.mvc.domain.Login;

@Controller
public class LoginController {
	
	// ModelAndView가 아닌 String으로 반환하는 이유?
	// 데이터 처리가 아닌 단순 경로 이름만 내보낼 것이기 때문에 상관쟈나이
	@RequestMapping(value = "/member/login")
	public String getLoginForm() {
		
		// View Path : Resolver의 범위에 포함된 경로
		return "member/loginForm"; // /WEB-INF/view/member/loginForm.jsp
	}
	
	@RequestMapping(value = "/member/loginProcess", method= RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request) {
		String id = request.getParameter("uId");
		String pw = request.getParameter("uPw");
		System.out.println(id + " + " + pw);
		
		ModelAndView modelAndView = new ModelAndView();
		// view이름 설정
		modelAndView.setViewName("member/login");
		modelAndView.addObject("id",id);
		modelAndView.addObject("pw",pw);
		return modelAndView;
	}
	
	@RequestMapping("/member/loginProc")
	public String loginproc(
			@RequestParam(value="uId",defaultValue="hoho") String id,
			@RequestParam(value="uPw", required = false) String pw, 
			// ## 만약 required false 설정하지 않은 상태에서 요청값이 잘못 들어왔다면 400 Bad Request 에러 뜸
			Model model
			) { // request 파라미터의 uId를 String id 변수에 저장.== request.getParameter()
		
		System.out.println("id : "+ id+", pw : "+pw);
		
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		
		return "member/login";
	}
	@RequestMapping("/member/loginOk")
	
	public String loginOk(@ModelAttribute("login") Login login) {
		System.out.println(login.getuId()+" : "+login.getuPw());
		
		// 들어온 데이터를 가공처리하는 것도 가능하다!
		login.setuId(login.getuId() + "-123");
		return "member/login";
	}
}
