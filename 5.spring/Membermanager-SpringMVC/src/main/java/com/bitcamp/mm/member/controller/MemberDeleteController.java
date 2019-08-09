package com.bitcamp.mm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.member.service.MemberDeleteService;

@Controller
public class MemberDeleteController {
	@Autowired
	private MemberDeleteService deleteService;
	
	@RequestMapping("member/delete")
	public String delete(@RequestParam("uId") String uId, Model model) {
		
		int rCnt = deleteService.deleteService(uId);
		
		model.addAttribute("rCnt", rCnt);
		
		return "member/delete";
	}
}
