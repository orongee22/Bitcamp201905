package com.bitcamp.mm.member.domain;

public class RequestMemberEdit {
	private int idx;
	private String uId;
	private String uPW;
	private String uName;
	private String uPhoto;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
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
	public String getuPhoto() {
		return uPhoto;
	}
	public void setuPhoto(String uPhoto) {
		this.uPhoto = uPhoto;
	}
	@Override
	public String toString() {
		return "RequestMemberEdit [idx=" + idx + ", uId=" + uId + ", uPW=" + uPW + ", uName=" + uName + ", uPhoto="
				+ uPhoto + "]";
	}
	
}
