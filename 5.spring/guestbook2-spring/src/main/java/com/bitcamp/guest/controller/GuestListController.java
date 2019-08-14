package com.bitcamp.guest.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.guest.domain.MessageListView;
import com.bitcamp.guest.service.GetMessageListService;

@Controller
public class GuestListController {
	
	@Autowired
	public GetMessageListService listService;
	
	@RequestMapping("/guest/list")
	public String getList(@RequestParam(value = "page", defaultValue="1") int pageNumber, Model model) {
		MessageListView listView = listService.getMessageListView(pageNumber);
		
		model.addAttribute("viewData",listView);
		
		return "/guest/list_view";
	}
	
	
	// ajax url:"guest/listJson"를 통해 들어옴.
	// ajax처리를 위해선 json 객체를 받아와야한다.
	// listView를 반환하면 pom.xml 에서 등록한 jackson라이브러리가 자바 객체를 json타입으로 변환시켜줌.
	// 그래서 해당 경로로 들어가면json을 얻어올 수 있는 것!
	@RequestMapping("guest/listJson")
	@ResponseBody
	public MessageListView getListJson(
			@RequestParam(value="page", defaultValue="1") int pageNumber,HttpServletResponse response) {
		
//		response.setStatus(0);
		MessageListView listView = listService.getMessageListView(pageNumber);
		return listView;
	}
			
}
