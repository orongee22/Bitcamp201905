package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DateService;
import service.GreetingService;
import service.OtherService;
import service.Service;

@WebServlet("/")
public class frontController extends HttpServlet {

	Map<String, Service> commands = new HashMap<String, Service>();
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String configFile = config.getInitParameter("config");
		Properties prop = new Properties();
		FileInputStream fis = null;
		
		String configFilePath = config.getServletContext().getRealPath(configFile);
		try {
			fis = new FileInputStream(configFilePath);
			prop.load(fis);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServletException(e);
		} finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		Iterator keyItr = prop.keySet().iterator();		
		while(keyItr.hasNext()) {
			String command = (String) keyItr.next();
			String serviceClassName = prop.getProperty(command);
			
			try {
				Class serviceClass = Class.forName(serviceClassName);
				Service serviceInstance = (Service) serviceClass.newInstance();
				commands.put(command, serviceInstance);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파악 : parameter 값으로 사용자의 요청을 분석 / 구분함.
		// 사용자의 URI을 command라는 변수에 담아둠.
		String command = request.getRequestURI();
		System.out.println("사용자 요청 URI : "+command);
		
		// command가 루트경로인 `/front`라면 index값이 0으로 뜸. 루트경로로 들어왓는지 확인하는 방법임
		if(command.indexOf(request.getContextPath()) == 0) {
			//command = command.substring(beginIndex);
			command = command.substring(request.getContextPath().length());
		}
		
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
