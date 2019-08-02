package com.bitcamp.guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bitcamp.guestbook.domain.Message;
import jdbc.JdbcUtil;


public class MessageDao {
	// DAO 직접 참조 불가능 하게 함.
	// DAO는 오로지 하나의 객체만을 가짐. 그렇기 떄문에 싱글톤처리해서
	// 참조 불가능하게 만들어 주는 것임.
	private static MessageDao dao = new MessageDao();
	
	public static MessageDao getInstance() {
		return dao;
	}
	// 생성자 또한 참조 불가능하게 private
	private MessageDao() {}
	
	// insert하면 int / 실행횟수를 반환하게 됨.
	// 그래서 int값임
	public int insert(Connection conn, com.bitcamp.guestbook.domain.Message message) {
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "insert into guestbook_message"
				+ "(message_id, guest_name, password, message)"
				+ " values (gm_mid_seq.nextval, ?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3,message.getMessage());
			
			rCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return rCnt;
	}
	
	// select의 반환 값은 행 단위 웅앵~
	// 이걸 message객체로 받아서 사용할 것임.
	public Message select(Connection conn, int messageId) {
		Message message = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from guestbook_message where message_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				message = new Message();
				message.setId(rs.getInt(1));
				message.setGuestName(rs.getString(2));
				message.setPassword(rs.getString(3));
				message.setMessage(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return message;
		
	}
	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int totalCnt = 0;

		String sql = "select count(*) from guestbook_message";
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				totalCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return totalCnt;
	}
	public List<Message> selectList(Connection conn, int firstRow, int endRow) {
		
		List<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select message_id, guest_name, password, message from ( "
				+ " select rownum rnum, message_id, guest_name, password, message from ( "
				+ " select * from guestbook_message m order by m.message_id desc "
				+ " ) where rownum <= ? "
				+ ") where rnum >= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			
			rs = pstmt.executeQuery();
			
			// View 구성하는 부분임. 아이디부터 모든 거 다 반복하면서 출력함.
			while(rs.next()) {
				Message msg = new Message();
				msg.setId(rs.getInt(1));
				msg.setGuestName(rs.getString(2));
				msg.setPassword(rs.getString(3));
				msg.setMessage(rs.getString(4));
				
				list.add(msg);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		return list;
	}
	public int deleteMessage(Connection conn, int messageId) throws SQLException {
		int resultCnt = 0;
		// Result rs에 담기
		
		PreparedStatement pstmt = null;
		String sql = "delete from guestbook_message where message_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			
			resultCnt = pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}
}
