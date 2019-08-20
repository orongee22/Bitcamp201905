package com.bitcamp.mm.member.service;

import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("mailSenderService")
public class MailSenderervice {
	@Autowired
	private JavaMailSender sender;
	
	public int send(String email) {
		MimeMessage message = sender.createMimeMessage();
		try {
			message.setSubject("인증","UTF-8");
			String html = "<p style=\"background-color:skyblue;color:white;font-size:24px\">따봉또치야 고마워~!~!~!~!~!</p>"+"<img src=\"cid:ddochi\" >";
			message.setText(html,"UTF-8","html");
			message.setFrom(new InternetAddress("j35147@naver.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress("j35148@hanmail.net"));
			
			sender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 1;
	}
}
