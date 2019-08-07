package com.bitcamp.mm.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberRegist {
	private String uId;
	private String uPW;
	private String uName;
	// MultipartFile :  파일 이름. 파일 사이즈, 파일 저장하는 경로 등등 객체로부터 가져올 수 있음.
	private MultipartFile uPhoto;
	
	
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPW() {
		return uPW;
	}
	public void setuPW(String uPW) {
		this.uPW = uPW;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public MultipartFile getuPhoto() {
		return uPhoto;
	}
	public void setuPhoto(MultipartFile uPhoto) {
		this.uPhoto = uPhoto;
	}
	@Override
	public String toString() {
		return "RequestMemberRegist [uId=" + uId + ", uPw=" + uPW + ", uName=" + uName + ", uPhoto=" + uPhoto + "]";
	}
	
	public MemberInfo toMemberInfo() {
		// 사용자가 입력한 정보를 MemberInfo에 저장시킴.
		MemberInfo info = new MemberInfo();
		
		info.setuId(this.uId);
		info.setuName(this.uName);
		info.setuPW(this.uPW);
		
		return info;
	}
}
