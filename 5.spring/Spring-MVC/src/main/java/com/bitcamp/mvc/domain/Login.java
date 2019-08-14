package com.bitcamp.mvc.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

// Bean클래스
// 변수는 private 처리 & 기본 생성자 필수 & setter 설정
public class Login {
	private String uId; // form에서 정보를 얻어올 개체의 name과 같은 이름 사용.
	@JsonIgnore
	private String uPw; 

	public Login() {}
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
}
