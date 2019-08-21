package com.bitcamp.mm.member.service;

import java.io.UnsupportedEncodingException;

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
	
	public void send(String getuId, String code) {
		MimeMessage message = sender.createMimeMessage();
		
		try {
			message.setSubject("회원가입 ㅊㅋㅊㅋ","UTF-8");
			String html = "<p>회원가입 축하합니다. 인증번호 받으세요</p>";
			html += "<p><a href=\"http://localhost:8080/mm/member/verify?id="+getuId+"&code="+code+"\">인증하기</a></p>";
			message.setText(html,"UTF-8","html");
			message.setFrom(new InternetAddress("j35147@naver.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(getuId,"고객님", "UTF-8"));
			sender.send(message);
			
		} catch(MessagingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public void reSend(String id, String code) {
		MimeMessage message = sender.createMimeMessage();
		
		try {
			message.setSubject("이메일 인증","UTF-8");
			String html = "<p>이메일 인증하ㅔㅅ</p>";
			html += "<p><a href=\"http://localhost:8080/mm/member/verify?id="+id+"&code="+code+"\">인증하기</a></p>";
			
			message.setText(html,"utf-8","html");
			message.setFrom(new InternetAddress("j35147@naver.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(id,"고객님","utf-8"));
			
			sender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
}
