package com.bitcamp.mvc;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.mvc.domain.GuestMessage;
import com.bitcamp.mvc.domain.GuestMessageList;

@Controller
public class GuestListController {
	@RequestMapping("/guest/xmlList.xml")
	@ResponseBody
	public GuestMessageList xmlList() {
		return getMessageList();
	}
	
	private GuestMessageList getMessageList() {
		List<GuestMessage> message = new ArrayList<GuestMessage>();
		message.add(new GuestMessage(1,"안녕하세요",new Date()));
		message.add(new GuestMessage(2,"b",new Date()));
		message.add(new GuestMessage(3,"ㅠㅠㅠㅜㅠ",new Date()));
		return new GuestMessageList(message);
	}
}
