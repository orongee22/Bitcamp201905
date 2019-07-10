package jdbc;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Loader extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException {
		String drivers = config.getInitParameter("jdbcdriver");
		StringTokenizer st = new StringTokenizer(drivers, ",");
		while(st.hasMoreTokens()) {
			String driver = st.nextToken();
			
			// DB 드라이버 로드
			try {
				// 중요중요중ㅇ요
				Class.forName(driver);
				
				System.out.println("DB 드라이버 등록 성공");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


}
