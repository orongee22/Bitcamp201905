package com.bitcamp.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bitcamp.mm.jdbc.JdbcUtil;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

@Repository("dao")
public class MemberDao {
	
	public MemberInfo selectMemberById(Connection conn, String userId) {
		
		MemberInfo memberInfo = null;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.println("dao : memberId -> " + userId);
		
		String sql = "select * from project.member where uid=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs = pstmt.executeQuery();
			if(rs!=null && rs.next()) {
				System.out.println("check ::::::::::::::::::::::::");
				memberInfo = new MemberInfo(
					rs.getInt("idx"), 
					rs.getString("uid"), 
					rs.getString("upw"), 
					rs.getString("uname"), 
					rs.getString("uphoto"), 
					new Date(rs.getTimestamp("regdate").getTime()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		
		return memberInfo;
	}

	public int insertMember(Connection conn, MemberInfo memberInfo) {
		
		PreparedStatement pstmt = null;
		
		int rCnt = 0;
		System.out.println(memberInfo.getuId());
		String sql = "insert into project.member (uid, uname, upw, uphoto) values (?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberInfo.getuId());
			pstmt.setString(2, memberInfo.getuName());
			pstmt.setString(3, memberInfo.getuPW());
			pstmt.setString(4, memberInfo.getuPhoto());
			rCnt = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rCnt;
		
	}
	
	public List<MemberInfo> selectList(Connection conn, int index, int count) {
		List<MemberInfo> memberList = new ArrayList<MemberInfo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM project.member order by uname limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			pstmt.setInt(2, count);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberList.add(new MemberInfo(rs.getInt("idx"), rs.getString("uid"), rs.getString("upw"), rs.getString("uname"), rs.getString("uphoto"), new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	
	public int selectTotalCount(Connection conn,SearchParam searchparam) {
		
		int totalCount = 0;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from project.member";
		
		if(searchparam != null) {
			if(searchparam.getSearchType().equals("both")) {
				sql += " where uid like '%"+searchparam.getKeyword()+"%' or uname like '%"+searchparam.getKeyword()+"%'";
			}
			if(searchparam.getSearchType().equals("id")) {
				sql += " where uid like '%"+searchparam.getKeyword()+"%'";
			}
			if(searchparam.getSearchType().equals("name")) {
				sql += " where uname like '%"+searchparam.getKeyword()+"%'";
			}
		}
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				totalCount = rs.getInt(1);
				System.out.println("totalCount"+totalCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<MemberInfo> selectListByBoth(Connection conn, int index, int count, SearchParam searchparam) {
		List<MemberInfo> memberList = new ArrayList<MemberInfo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member where uid like ? or uname like ? limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+ searchparam.getKeyword() +"%");
			pstmt.setString(2, "%"+ searchparam.getKeyword() +"%");
			pstmt.setInt(3,  index);
			pstmt.setInt(4, count);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberList.add(new MemberInfo(rs.getInt("idx"), rs.getString("uid"), rs.getString("upw"), rs.getString("uname"), rs.getString("uphoto"), new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	
	public List<MemberInfo> selectListById(Connection conn, int index, int count, SearchParam searchparam) {
		List<MemberInfo> memberList = new ArrayList<MemberInfo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member where uid like ? limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+ searchparam.getKeyword()+"%");
			pstmt.setInt(2,  index);
			pstmt.setInt(3, count);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberList.add(new MemberInfo(rs.getInt("idx"), rs.getString("uid"), rs.getString("upw"), rs.getString("uname"), rs.getString("uphoto"), new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	
	public List<MemberInfo> selectListByName(Connection conn, int index, int count, SearchParam searchparam) {
		List<MemberInfo> memberList = new ArrayList<MemberInfo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member where uname like ? limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+ searchparam.getKeyword()+"%");
			pstmt.setInt(2,  index);
			pstmt.setInt(3, count);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberList.add(new MemberInfo(rs.getInt("idx"), rs.getString("uid"), rs.getString("upw"), rs.getString("uname"), rs.getString("uphoto"), new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	
	
	public int editMemberById(Connection conn, MemberInfo memberinfo) {
		int rCnt = 0;
		PreparedStatement pstmt=null;
		
		String sql = "update project.member set upw = ?, uname =?, uphoto=? where uid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberinfo.getuPW());
			pstmt.setString(2, memberinfo.getuName());
			pstmt.setString(3, memberinfo.getuPhoto());
			pstmt.setString(4, memberinfo.getuId());
			rCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return rCnt;
	}

	public int deleteMemberById(Connection conn, String uId) {
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "delete from project.member where uid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			
			rCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rCnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}