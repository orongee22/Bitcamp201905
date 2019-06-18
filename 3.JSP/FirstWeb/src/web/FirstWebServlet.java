package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/first")

// HttpServlet을 반드시 상속받아 사용해야 함!
public class FirstWebServlet extends HttpServlet {       
   
	// request에선 사용자 요청정보를 변수로 담아 가지고 있음. 
	// 변수를 참조할 때는 메소드를 이용해서 참조가능쓰
	// 사용자가 요청한 데이터를 물어보고 잘라서 변수로 가지고 있는건데 request를 이용, 메소드를 통해 사용자의 데이터를 담은 변수를 참조해서 사용따리
	// response는 응답하는 데이터를 담아 보내는 거임. 
	// 이 response에 담긴 데이터를 아파치를 통해 클라이언트로 텍스트 보내는 거임.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ServletException 아파치에서 제공하는 예외
		
		// 응답하는 타입에 대한 정의
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>first Web</title></head>");
		out.println("<body><p>시간 : "+ new Date() + "</p></body></html>");
	}

}
