package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.bitcamp.mm.member.domain.ListViewData;
import com.bitcamp.mm.member.domain.SearchParam;
import com.bitcamp.mm.member.service.MemberListService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberListController {
	@Autowired
	private MemberListService listService;
	
	@RequestMapping("member/json/memberListJson")
	// 회원 리스트 페이지에 들어갔을 댸 기본 페이지 번호는 언제나 1이어야 한다. defaultValue값 필수
	public @ResponseBody ListViewData memberlist(@RequestParam(value = "page", defaultValue="1") int pageNumber,
			@RequestParam(value="searchType", required = false) String sType,
			@RequestParam(value="keyword", required = false) String keyword ,
			HttpServletResponse response
			) {
		
		SearchParam searchparam = null;
		response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		
		if(sType != null && keyword != null && !sType.isEmpty() && !keyword.isEmpty()) {
			searchparam = new SearchParam();			
			searchparam.setSearchType(sType);
			searchparam.setKeyword(keyword);
		}
		
		ListViewData listData = listService.getListData(pageNumber, searchparam);
	
		return listData;
	}
	
	// 반환 타입 : ResponseEntity<T> - Spring 4.2 이상
	// 반환 값 : Body(ListViewData), statusCode, HttpHeader
	@RequestMapping("member/json/memberListJson2")
	public ResponseEntity<ListViewData> memberlist2(@RequestParam(value = "page", defaultValue="1") int pageNumber,
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
		
		ResponseEntity<ListViewData> entity = new ResponseEntity<ListViewData>(listData, HttpStatus.OK);
	
		return entity;
	}
}
