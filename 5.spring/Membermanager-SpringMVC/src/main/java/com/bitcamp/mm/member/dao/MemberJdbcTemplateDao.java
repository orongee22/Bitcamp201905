package com.bitcamp.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bitcamp.mm.jdbc.JdbcUtil;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

@Repository("templateDao")
public class MemberJdbcTemplateDao {
	
	@Autowired
	JdbcTemplate template;
	
	public MemberInfo selectMemberById(String userId) {
		String sql = "select * from project.member where uid=?";
		// new Object[]{} => 파라미터 값이 많을 경우 : 배열 형태로 묶어서 한번에 처리하기 위해 새로운 배열 객체를 생성해서 전달해준다.
		List<MemberInfo> list = template.query(sql, new Object[] {userId}, new MemberInfoRowMapper());
		// 뒤에 동적 매개변수 형식으로 RowMapper 다음으로 나열해주어도 상관 X
		// List<MemberInfo> list = template.query(sql, new MemberInfoRowMapper(), uid, upw...); // 이런 식으로 하는 거랑 똑같음
		return list.isEmpty()?null:list.get(0);
	}
	
	public MemberInfo selectMemberById2(String userId) {
		String sql = "select * from project.member where uid=?";
		// new Object[]{} => 파라미터 값이 많을 경우 : 배열 형태로 묶어서 한번에 처리하기 위해 새로운 배열 객체를 생성해서 전달해준다.
		MemberInfo memberinfo = null;
		
		try {
		memberinfo = template.queryForObject(sql, new Object[] {userId}, new MemberInfoRowMapper());
		// RowMapper에 제대로 값이 전달되지 못하는 경우가 생길 수도 있다. DataAccessException 에러임!
		// 그래서 예외 처리 따로 설정해주는 거
		} catch(DataAccessException e) {
			e.printStackTrace();
		}
		// 뒤에 동적 매개변수 형식으로 RowMapper 다음으로 나열해주어도 상관 X
		// List<MemberInfo> list = template.query(sql, new MemberInfoRowMapper(), uid, upw...); // 이런 식으로 하는 거랑 똑같음
		return memberinfo;
	}
	
//	public MemberInfo selectMemberById(Connection conn, String userId) {
//		
//		MemberInfo memberInfo = null;
//		
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		
//		System.out.println("dao : memberId -> " + userId);
//		
//		String sql = "select * from project.member where uid=?";
//		
//		try {
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1,userId);
//			rs = pstmt.executeQuery();
//			if(rs!=null && rs.next()) {
//				System.out.println("check ::::::::::::::::::::::::");
//				memberInfo = new MemberInfo(
//					rs.getInt("idx"), 
//					rs.getString("uid"), 
//					rs.getString("upw"), 
//					rs.getString("uname"), 
//					rs.getString("uphoto"), 
//					new Date(rs.getTimestamp("regdate").getTime()));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			JdbcUtil.close(rs);
//			JdbcUtil.close(pstmt);
//		}
//		
//		
//		return memberInfo;
//	}

	public int insertMember(MemberInfo memberInfo) {
		String sql = "insert into project.member (uid, uname, upw, uphoto) values (?, ?, ?, ?)";
		return template.update(sql, memberInfo.getuId(), memberInfo.getuName(), memberInfo.getuPW(), memberInfo.getuPhoto());
		
	}
	
	public List<MemberInfo> selectList(int index, int count) {
		String sql = "SELECT * FROM project.member order by uname limit ?,?";
		
		return template.query(sql, new MemberInfoRowMapper(), index, count);
	}
	
	
	public int selectTotalCount(SearchParam searchparam) {
		String sql = "select count(*) from project.member";
		
		return template.queryForObject(sql, Integer.class);
	}
	
	public List<MemberInfo> selectListByBoth(int index, int count, SearchParam searchparam) {
		String sql = "SELECT * FROM member where uid like ? or uname like ? limit ?,?";
		
		return template.query(sql, new MemberInfoRowMapper(), "%"+searchparam.getKeyword()+"%","%"+searchparam.getKeyword()+"%", index, count);
	}
		
	public List<MemberInfo> selectListById(int index, int count, SearchParam searchparam) {
		String sql = "SELECT * FROM member where uid like ? limit ?,?";
		
		return template.query(sql, new MemberInfoRowMapper(), "%"+searchparam.getKeyword()+"%", index, count);
	}
	
	public List<MemberInfo> selectListByName(int index, int count, SearchParam searchparam) {
		String sql = "SELECT * FROM member where uname like ? limit ?,?";
		return template.query(sql, new MemberInfoRowMapper(), "%"+searchparam.getKeyword()+"%", index, count);
	}
	
	
	
	public int editMemberById(MemberInfo memberinfo) {
		String sql = "update project.member set upw = ?, uname =?, uphoto=? where uid = ?";
		return template.update(sql, memberinfo.getuPW(), memberinfo.getuName(),memberinfo.getuPhoto(),memberinfo.getuId());
		
	}
	
	public int deleteMemberById(String uId) {
		String sql = "delete from project.member where uid = ?";
		
		return template.update(sql, uId);
	}
	
	
	
	
	
	
	
	
	
	
	
	

}