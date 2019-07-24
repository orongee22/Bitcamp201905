package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SimpleController")
public class SimpleController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파악 : parameter 값으로 사용자의 요청을 분석 / 구분함.
		// 사용자의 요청값(type값)을 command라는 변수에 담아둠.
		String command = request.getParameter("type");
		
		
		// 응답 결과
		String resultObj ="";
		String viewpage = "";
		
		// 요청에 맞는 기능을 수행함 - Model 처리함. (Service + DAO + 기능 Class) -> 결과 데이터 반환.
		if(command == null || command.equals("greeting")) {
			resultObj = "안녕하세요";
			viewpage = "/greetingpage.jsp";
			
		} else if(command.equals("date")) {
			// 날짜를 String으로 반환함.
			resultObj = new Date().toString();
			viewpage = "/datepage.jsp";
		} else {
			viewpage = "/resultpage.jsp";
		}
	
		
		// 결과 데이터를 request OR session 영역 속성으로 저장함. : View로 데이터를 전달하고 공유하는 목적임
		request.setAttribute("result", resultObj);
		
		
		// view 지정 
		// forwarding : 결과 view로 response 값 가진채로 이동시키기
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
		
	}

}
