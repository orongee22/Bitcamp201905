package member;

import java.util.Date;

public class MemberInfo {
	private String uId;
	private String uPw;
	private String uName;
	private String uPhoto;
	private Date regDate;
	
	// default 생성자는 반드시 필요함!
	// 아이디, 비밀번호같은 value값이 아무 것도 안 들어가 있을 시, 데이트 객체만 출력되게 할거임....
	public MemberInfo() {
		this.regDate = new Date();
	}
	
	public MemberInfo(String uId, String uPw, String uName, String uPhoto) {
		this.uId = uId;
		this.uPw = uPw;
		this.uName = uName;
		this.uPhoto = uPhoto;
		this.regDate = new Date();
	}
	
	// 변수들의 Getter/Setter  시작

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

		public Date getRegDate() {
			return regDate;
		}

		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}

		
		// 데이터 확인을 위한 toString 오버라이딩
		@Override
		public String toString() {
			return "MemberInfo [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uPhoto=" + uPhoto + ", regDate="
					+ regDate + "]";
		}
		
		// 화면 결과 출력을 위한 HTML 코드 반환
		public String makeHtmlDiv() {
			String str = "";
			
			str += "<div class=\"mInfor\"> \n";
			str += "	<h3> \n";
			str += "		" + uId + "("+ uName +")\n";
			str += "	</h3> \n";
			str += "	<p> \n";
			str += "		"+ uPw;
			str += "	</p> \n";
			str += "</div> \n";
			
			
			
			return str;
		}
		
		//MemberInfo 객체에서 LoginInfo 객체 생성해서 반환해줌.
		public LoginInfo toLoginInfo() {
			
			return new LoginInfo(uId, uName, uPhoto);
			
		}
	
}