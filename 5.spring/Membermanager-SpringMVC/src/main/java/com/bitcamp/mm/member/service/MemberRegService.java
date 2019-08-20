package com.bitcamp.mm.member.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;
import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;
import com.bitcamp.mm.member.dao.MemberSessionDao;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.RequestMemberRegist;

@Service("registService")
public class MemberRegService implements MemberService {
	
//	@Autowired
//	private MemberJdbcTemplateDao dao;
	//	private MemberDao dao; 
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Autowired
	private MailSenderervice mailService;

	private MemberSessionDao dao;
	
	// request : request path 를 통해 파일 절대 경로 구하기 위해서 매개변수로 받아옴.
	// regist : 회원 정보 받아오기 필수.
	public int memberInsert(HttpServletRequest request, RequestMemberRegist regist) {
		// 파일을 받아올 서버 경로 설정
		String path = "/uploadfile/userphoto"; // 프론트 컨트롤러가 읽지 않게 resource mapping 설정 필수.
		// 시스템 절대 경로 설정
		String dir = request.getSession().getServletContext().getRealPath(path);
		System.out.println(dir);
		// MemberInfo.uphoto에 파일 경로 저장하기 위한 용도
		MemberInfo memberInfo = regist.toMemberInfo();
		// 새로운 파일 이름 생성 : 파일 이름 중복 방지 - nanoTime()
		// 1. 회원 아이디 + 시간
		//String newFileName = memberInfo.getuId()+System.nanoTime()+;
		// 2. 회원 아이디 + 파일이름
		
		int resultCnt = 0;
		String newFileName = null;
		
		
//		Connection conn = null;
		
		// photo값 웅앵에서 예외발생 시 DB 저장 못하게 미리 방지
		try {
//			conn = ConnectionProvider.getConnection();
			dao = template.getMapper(MemberSessionDao.class);
			if(regist.getuPhoto()!= null) {
				newFileName = memberInfo.getuId()+"_"+regist.getuPhoto().getOriginalFilename();
				regist.getuPhoto().transferTo(new File(dir, newFileName));
				memberInfo.setuPhoto(newFileName);
			}
			// 파일을 서버의 지정 경로에 저장하기.
			// DB 저장용 . uphoto에 저장하기.
//			resultCnt = dao.insertMember(conn, memberInfo);
			resultCnt = dao.insertMember(memberInfo);
			
			mailService.send(regist.getuId());
		} catch (IllegalStateException e) {
			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
			// DB에서 오류가 발생 했을 시
		} catch (IOException e) {
			e.printStackTrace();
			// 입출력 문제가 발생했을 시
		}catch (Exception e) {
			if(regist.getuPhoto()!=null) {
				new File(dir,newFileName).delete();
			}
		}
		
		return resultCnt;
		
	}
	
	public String idCheck(String uId) {
		dao=template.getMapper(MemberSessionDao.class);
		System.out.println("gdl");
		System.out.println("dao select"+dao.selectMemberById(uId));
		String chk = dao.selectMemberById(uId)==null?"Y":"N";
		return chk;
	}
	
}