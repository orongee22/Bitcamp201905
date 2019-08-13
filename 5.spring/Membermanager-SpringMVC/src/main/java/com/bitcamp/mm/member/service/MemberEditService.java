package com.bitcamp.mm.member.service;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;
import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;
import com.bitcamp.mm.member.dao.MemberSessionDao;
import com.bitcamp.mm.member.domain.LoginInfo;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.RequestMemberRegist;

@Service
public class MemberEditService implements MemberService {
	@Autowired
	SqlSessionTemplate template;
//	private MemberJdbcTemplateDao dao;
	//	private MemberDao dao;
	private MemberSessionDao dao;
	
	public int editService(RequestMemberRegist regist, HttpServletRequest request) {
		int rCnt = 0;
		dao=template.getMapper(MemberSessionDao.class);
//		Connection conn = null;
		
		MemberInfo memberinfo = regist.toMemberInfo();
		LoginInfo logininfo = null;
		
		String path = "/uploadfile/userphoto";
		String dir = request.getSession().getServletContext().getRealPath(path);
		
		String newFileName = memberinfo.getuId()+"_"+regist.getuPhoto().getOriginalFilename();
		try {
//			conn = ConnectionProvider.getConnection();
			
			regist.getuPhoto().transferTo(new File(dir, newFileName));
			memberinfo.setuPhoto(newFileName);
			
			
			request.getSession(false).setAttribute("loginInfo", memberinfo.toLoginInfo());
			
//			rCnt = dao.editMemberById(conn, memberinfo);
			rCnt = dao.editMemberById(memberinfo);
//		} catch (SQLException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rCnt;
	}
}
