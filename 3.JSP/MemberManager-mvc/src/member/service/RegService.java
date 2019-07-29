package member.service;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.MemberInfo;

public class RegService implements MemberService{
	
	
	
	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		String view = "WEB-INF/view/memberReg2.jsp";
	
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		String uName = request.getParameter("uName");
		String uPhoto = request.getParameter("uPhoto");
		
		
		MemberInfo mInfo = new MemberInfo(uId, uPw, uName, uPhoto);
		
		int result = 0;
		Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				MemberDao dao = MemberDao.getInstance();
				
				result = dao.insert(conn, mInfo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		
		request.setAttribute("result",result);
		
		return view;
	}

}
