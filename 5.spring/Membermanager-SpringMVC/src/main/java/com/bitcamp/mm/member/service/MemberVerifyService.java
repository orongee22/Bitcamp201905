package com.bitcamp.mm.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.member.dao.MemberSessionDao;
import com.bitcamp.mm.member.domain.MemberInfo;

@Service
public class MemberVerifyService {
	
	@Autowired
	private MailSenderervice mailService;
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberSessionDao dao;
	
	public String verify(String id, String code) {
		dao = template.getMapper(MemberSessionDao.class);
		
		int rCnt = dao.verify(id, code);
		return rCnt>0?"Success":"Fail";
	}
	
	public int reMailSend(String email) {
		dao = template.getMapper(MemberSessionDao.class);
		
		MemberInfo memberInfo = dao.selectMemberById(email);
		
		mailService.reSend(memberInfo.getuId(),memberInfo.getCode());
		
		return 1;
		
	}
	
	
}
