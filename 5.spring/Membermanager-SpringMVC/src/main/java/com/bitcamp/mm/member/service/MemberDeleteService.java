package com.bitcamp.mm.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;
import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;

@Service
public class MemberDeleteService implements MemberService {
	@Autowired
	private MemberJdbcTemplateDao dao;
//	private MemberDao dao;
	public int deleteService(String uId) {
		int rCnt = 0;
//		Connection conn = null;
		
//		try {
//			conn = ConnectionProvider.getConnection();
//			rCnt = dao.deleteMemberById(conn, uId);
			rCnt = dao.deleteMemberById(uId);
		//		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		System.out.println("rCnt : "+rCnt);
		
		return rCnt;
	}
}
