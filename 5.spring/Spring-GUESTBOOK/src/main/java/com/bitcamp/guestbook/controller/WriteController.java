package com.bitcamp.guestbook.controller;

import java.sql.Connection;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.guestbook.domain.Message;

@Controller
public class WriteController {
	@RequestMapping("/guestWriteForm")
	public String writeForm() {
		return "writeForm";
	}
	
	@RequestMapping(value="/guestWrite", method=RequestMethod.GET)
	public String getwriteForm() {
		return "writeForm";
	}
	
	@RequestMapping(value="/guestWrite", method=RequestMethod.POST)
	public String writeMessage(Message message) {
		
		return "writeMessage";
	}
}
