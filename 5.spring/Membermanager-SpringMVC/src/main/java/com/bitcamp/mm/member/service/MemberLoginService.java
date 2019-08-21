package com.bitcamp.mm.member.service;

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
import com.bitcamp.mm.member.domain.MemberInfo;

@Service
public class MemberLoginService implements MemberService{
	
	/*
	 * @Autowired private MemberDao dao;
	 */
//	@Autowired
//	private MemberJdbcTemplateDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberSessionDao dao;

	/* 
	 * loginChk = 0  // 로그인 실패
	 * loginChk = 1 // 로그인 미인증상태
	 * loginChk = 2 // 로그이 인증상태
	 * 
	 * */
	
	
	public int login(String id, String pw, HttpServletRequest request) {
//		boolean loginChk = false;
	
	
		int loginChk = 0;
		
		
		MemberInfo memberInfo = null;
		dao = template.getMapper(MemberSessionDao.class);
		
//		Connection conn = null;
//		try {
//			conn = ConnectionProvider.getConnection();
//			memberInfo = dao.selectMemberById(conn, id);
			memberInfo = dao.selectMemberById(id);
			
			if(memberInfo!=null && memberInfo.pwChk(pw)) {
				// 세션에 저장함.
				// loginChk 상태값을 변경함.
				
				if(memberInfo.getVerify()== 'Y') {
					request.getSession(true).setAttribute("loginInfo", memberInfo.toLoginInfo());
					loginChk = 2;
				} else {
					request.getSession(true).setAttribute("reEmail", memberInfo.getuId());
					loginChk = 1;
				}
			}
		
		return loginChk;
	}
}
