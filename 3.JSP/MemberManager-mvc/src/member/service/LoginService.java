package member.service;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.LoginInfo;

public class LoginService implements MemberService{

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		String view = "WEB-INF/loginProcess.jsp";
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
	
		Connection conn = null;
		LoginInfo loginInfo = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao dao = MemberDao.getInstance();
			
			
			loginInfo = dao.login(conn, uId, uPw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		if(loginInfo!=null) {
			
		}
		
		
		HttpSession session= null;
		session.setAttribute("loginInfo", loginInfo);
		return view;
	}
	
}
