package com.bitcamp.mm.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.MemberRestapiRegRequest;
import com.bitcamp.mm.member.domain.RequestMemberRegist;
import com.bitcamp.mm.member.service.MemberDeleteService;
import com.bitcamp.mm.member.service.MemberListService;
import com.bitcamp.mm.member.service.MemberRegService;

// URI : /rest-api/members         --> GET 방식 (전체 리스트 or 페이징 처리 된 리스트)
// 		 /rest-api/members/{id}    --> GET 방식 (해당 id를 가진 회원의 정보)
//       /rest-api/members         --> POST 방식 (회원 정보 저장)
//       /rest-api/members/{id}    --> PUT 방식 (회원 정보 수정)
//       /rest-api/members/{id}    --> DELETE 방식 (회원 정보 삭제)

@Controller 
@RequestMapping("/rest-api/members")
public class MemberRestApiController {
	
	@Autowired
	private MemberListService listService;
	
	@Autowired
	private MemberRegService regService;
	
	@Autowired
	private MemberDeleteService delService;
	
//	@RequestMapping("/{id}") // ==> /rest-api/members/{id}
	
	// 다른 도메인에서 접근하더라도 접근을 허용함. 이게 없다면 다른 곳에서 접근할 경우 "Access to XMLHttpRequest at ~~" 에러로 접근 불가함.
	@CrossOrigin
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public List<MemberInfo> getAllList(){
		
		return listService.getAllList();
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public String regMember(@RequestBody RequestMemberRegist regist, HttpServletRequest request) {
		
		int result = regService.memberInsert(request, regist);
		System.out.println(regist);
		return result > 0 ? "success" : "fail";
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="/{uId}", method=RequestMethod.DELETE)
	public String deleteMember(@PathVariable("uId")String uId ) {
		int result = delService.deleteService(uId);
		
		return result > 0 ? "success":"fail";
	}
}
