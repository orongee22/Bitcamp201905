package com.bitcamp.guestbook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewListController {
	
	@RequestMapping("/")
	public String viewList() {
		return "views/list_view";
	}
}
