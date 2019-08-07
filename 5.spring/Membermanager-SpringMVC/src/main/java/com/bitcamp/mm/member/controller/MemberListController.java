package com.bitcamp.mm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.bitcamp.mm.member.domain.ListViewData;
import com.bitcamp.mm.member.domain.SearchParam;
import com.bitcamp.mm.member.service.MemberListService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberListController {
	@Autowired
	private MemberListService listService;
	
	@RequestMapping("member/memberList")
	// 회원 리스트 페이지에 들어갔을 댸 기본 페이지 번호는 언제나 1이어야 한다. defaultValue값 필수
	public String memberlist(Model model, @RequestParam(value = "page", defaultValue="1") int pageNumber,
			@RequestParam(value="searchType", required = false) String sType,
			@RequestParam(value="keyword", required = false) String keyword 
			) {
		
		SearchParam searchparam = null;
		
		if(sType != null && keyword != null && !sType.isEmpty() && !keyword.isEmpty()) {
			searchparam = new SearchParam();			
			searchparam.setSearchType(sType);
			searchparam.setKeyword(keyword);
		}
		
		ListViewData listData = listService.getListData(pageNumber, searchparam);
		
		System.out.println(listData.getTotalCount());
		model.addAttribute("viewData", listData);
	
		return "member/memberList";
	}
}
