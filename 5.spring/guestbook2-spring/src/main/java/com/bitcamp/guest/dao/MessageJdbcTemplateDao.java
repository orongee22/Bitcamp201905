package com.bitcamp.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.jdbc.JdbcUtil;


@Repository("jdbcTemplateDao")
public class MessageJdbcTemplateDao {
	
	
	@Autowired
	JdbcTemplate template;
	
	public int insert(Message message) {
		
		String sql = "insert into guestbook_message"
				+ "(message_id, guest_name, password, message)"
				+ " values (gm_mid_seq.nextval, ?,?,?)";
		
		int rCnt = template.update(sql, message.getGuestName(),message.getPassword(),message.getMessage());
		return rCnt;
	}
	
	public Message select(int messageId) {
		String sql = "select * from guestbook_message where message_id=?";
		
		return template.queryForObject(sql, new MessageRowMapper(), messageId);
	}
	
	public int selectCount() {
		String sql = "select count(*) from guestbook_message";
		
		// sql의 결과값을 Integer형식의 Wrapper Class로 변환해서 반환한다.
		// wrapper class는 autoboxing을 통해 숫자를 받을 수있음...
		
		
		return template.queryForObject(sql, Integer.class);
	}
	
	
	public List<Message> selectList(int firstRow, int endRow) {
		String sql = "select message_id, guest_name, password, message from ( "
				+ " select rownum rnum, message_id, guest_name, password, message from ( "
				+ " select * from guestbook_message m order by m.message_id desc "
				+ " ) where rownum <= ? "
				+ ") where rnum >= ?";
		
		return template.query(sql, new MessageRowMapper(), endRow, firstRow);
	}
	
	public int deleteMessage(int messageId){
		String sql = "delete from guestbook_message where message_id=?";
		
		
		return template.update(sql, messageId); 
	}
}
