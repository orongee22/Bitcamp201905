package com.bitcamp.mm.member.domain;

// 회원가입 정보 저장 커맨드 객체
public class MemberRestapiRegRequest {
	private String uId;
	private String uName;
	private String uPW;
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPW() {
		return uPW;
	}
	public void setuPW(String uPW) {
		this.uPW = uPW;
	}
	@Override
	public String toString() {
		return "MemberRestapiRegRequest [uId=" + uId + ", uName=" + uName + ", uPW=" + uPW + "]";
	}
	
	public MemberInfo toMemberInfo() {
		MemberInfo memberInfo = new MemberInfo();
		memberInfo.setuId(uId);
		memberInfo.setuName(uName);
		memberInfo.setuPW(uPW);
		
		return memberInfo;
	}
}
