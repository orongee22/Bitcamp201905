package com.bitcamp.mvc;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SecurityController {
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private AES256Util aesUtil;
	
	@ResponseBody
	@RequestMapping("/encodepassword")
	public String bcrypt() {
		String str= "password";
		
		String encodingStr = encoder.encode(str);
		boolean result = encoder.matches(str, encodingStr);
//		System.out.println(encoder.matches(str, encodingStr));
		
		return str + " : " + encodingStr+"<br>"+result;
	}
	
	
	@ResponseBody
	@RequestMapping("/encodepassword1")
	public String bcrypt1() {
		
		String str= "password";		
		String encodingStr = Sha256.encrypt(str);
		String pw = "password";
		
//		boolean result = encoder.matches(str, encodingStr);
		boolean result = encodingStr.equals(Sha256.encrypt(pw));
		
//		System.out.println(encoder.matches(str, encodingStr));
		
		return str + " : " + encodingStr+"<br>"+result;
	}
	
	
	@ResponseBody
	@RequestMapping("/encodepassword2")
	public String bcrypt2() throws NoSuchAlgorithmException, GeneralSecurityException,
	UnsupportedEncodingException {
		
		String str= "1233";		
		String encodingStr = aesUtil.encrypt(str);
		String decodingStr = aesUtil.decrypt(encodingStr);
//		String pw = "1233";
		
//		boolean result = encoder.matches(str, encodingStr);
		
//		System.out.println(encoder.matches(str, encodingStr));
		
		return str + " : " + encodingStr+"<br>"+decodingStr;
	}
}
