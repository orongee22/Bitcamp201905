package com.bitcamp.mvc;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailSendController {
	@Autowired
	MailSender sender;
	
	@Autowired
	JavaMailSender javaSender;
	
	@RequestMapping("/mail/send")
	public String sendMail() {
		// 메일 내용 설정
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setTo("j35148@hanmail.net");
		message.setSubject("행운의 편지");
		message.setText("따봉또치가 당신에게 행운의 편지를 보냈습니다. 3분 안에 다른 사람에게 이 메시지를 보내지 않으면 불행이 올 것입니다. 따봉또치야 고마워 라는 문장을 보내세요.");
		message.setFrom("j35147@naver.com");
		
		sender.send(message);
		
		
		return "sendOK";
	}
	
	@RequestMapping("/mail/javasend")
	public String sendJavaMail() {
		MimeMessage message = javaSender.createMimeMessage();
		
		try {
			message.setSubject("행운의 편지2","UTF-8");
			String html = "<p style=\"background-color:red;color:white;font-size:40px\">따봉또치가 당신에게 행운의 편지를 보냈습니다. 3분 안에 다른 사람에게 이 메시지를 보내지 않으면 불행이 올 것입니다. 따봉또치야 고마워 라는 문장을 보내세요.</p>";
			message.setText(html,"UTF-8","html");
			message.addRecipient(RecipientType.TO, new InternetAddress("j35148@hanmail.net"));
//			message.setFrom(new InternetAddress("j35147@naver.com"));
			javaSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MailException e) {
			e.printStackTrace();
		}
		
		
		return "sendOK";
	}
	
	@ResponseBody
	@RequestMapping("/mail/send2")
	public String sendFileAttach() {
		MimeMessage message = javaSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject("행운의 편지3");
			
			String html = "<p style=\"color: red; font-size: 20px;\">따봉또치의 기운을 받으세요</p>" + "<img src=\"cid:ddochi\">";
			messageHelper.setText(html,true);
			messageHelper.setTo(new InternetAddress("j35148@hanmail.net","예리나님","UTF-8"));
			
			//첨부할 파일 객체 생성하기
//			DataSource dataSource = new FileDataSource("C:\\Users\\5CLASS-184\\Documents\\ddochi.jpg");
			
			// MimeMessageHelper 파일 객체를 추가
//			messageHelper.addAttachment(MimeUtility.encodeText("ddochi.jpg"));
			messageHelper.addInline("ddochi", new FileDataSource("C:\\Users\\5CLASS-184\\Documents\\ddochi.jpg"));
			javaSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "sendOK";
	}
}
