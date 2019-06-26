package member;


// 로그인이 되었을 떄 가지고 있어야 할 정보들 클래스임.
// 로그인 정보가 수정되면 안되기 때문에 setter 안 만들거임~!
// 클래스를 이용한다묜 일일히 setAttribute 사용해서 속성 지정 안해줘도 됨

public class LoginInfo {
	private String id;
	private String name;
	private String photo;
	private String nickname;
	private int grade;
	private String pNum;
	
	public LoginInfo(String id, String name, String photo, String nickname, int grade, String pNum) {
		super();
		this.id = id;
		this.name = name;
		this.photo = photo;
		this.nickname = nickname;
		this.grade = grade;
		this.pNum = pNum;
	}

	public LoginInfo(String id) {
		super();
		this.id = id;
		this.name = "무명";
		this.photo = "no-image";
		this.nickname = "무명이";
		this.grade = 1;
		this.pNum = "none";
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhoto() {
		return photo;
	}

	public String getNickname() {
		return nickname;
	}

	public int getGrade() {
		return grade;
	}

	public String getpNum() {
		return pNum;
	}
	
}
