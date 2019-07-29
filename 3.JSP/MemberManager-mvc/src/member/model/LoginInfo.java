package member.model;

import java.util.Date;

public class LoginInfo {
	
	private String uId;
	private String uName;
	private String uPhoto;
	private Date regDate;
	
	public LoginInfo(String uId, String uName, String uPhoto, Date regDate) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.uPhoto = uPhoto;
		this.regDate = regDate;
	}

	public String getuId() {
		return uId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public void setuPhoto(String uPhoto) {
		this.uPhoto = uPhoto;
	}

	public String getuName() {
		return uName;
	}

	public String getuPhoto() {
		return uPhoto;
	}
	
	public Date getregDate() {
		return regDate;
	}
	
	// 저장 용도
	@Override
	public String toString() {
		return "LoginInfo [uId=" + uId + ", uName=" + uName + ", uPhoto=" + uPhoto + ", regDate =" + regDate + "]";
	}
	
	
	
	
}