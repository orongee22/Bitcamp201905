package com.bitcamp.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.jdbc.JdbcUtil;


@Repository("sessionTemplateDao")
public class MessageSessionTemplateDao {
	
	@Autowired
	JdbcTemplate template;
	
	@Autowired
	private SqlSessionTemplate ssTemplate;
	
	private String nameSpace = "com.bitcamp.guest.mapper.mybatis.guestMapper";
	
	public int insert(Message message) {
		
		String str = nameSpace+".insertMessage";
		
		int rCnt = ssTemplate.update(str, message);
		return rCnt;
	}
	
	public int selectCount() {
		
		// selectOne : sqlSessionTemplate이 제공하는 select 메소드. 하나의 매개변수를 이용해 select해야하는 경우 selectOne을 사용한다.
		return ssTemplate.selectOne(nameSpace+".selectCount");
	}
		
	public List<Message> selectList(Map<String, Object> params) {
		return ssTemplate.selectList(nameSpace+".selectList", params);
	}
	
	public Message select(int messageId) {
		return ssTemplate.selectOne(nameSpace+".select",messageId);
	}
	
	
	public int deleteMessage(int messageId){
		
		return ssTemplate.delete(nameSpace+".deleteMessage", messageId);
	}
}
