package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.RequestMemberRegist;
import com.bitcamp.mm.member.service.MemberEditService;

@Controller
@RequestMapping("member/edit")
public class MemberEditController {
	@Autowired 
	private MemberEditService editService;
	
	@RequestMapping(method= RequestMethod.GET)
	public String getEditForm(HttpServletRequest request, @RequestParam("uId") String uId, Model model) {
//		MemberInfo memberInfo = editService.editService(regist, request)
//		
//		model.addAttribute("mInfo", memberInfo);
		
		return "member/editForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String edit(RequestMemberRegist regist, Model model, HttpServletRequest request) {
		int rCnt = editService.editService(regist, request);
		model.addAttribute("rCnt", rCnt);
		return "member/edit";
	}
}