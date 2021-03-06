package guestbook.model;

public class Message {
	
	private int id;
	private String guestName;
	private String password;
	private String message;
	
	
	public Message() {}
	public Message(int id, String guestName, String password, String message) {}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	// 패스워드가 있는 지 없는 지 판단하는 메소드.
	// 패스워드가 null인지? 비어있진 않은지? 확인
	public boolean hasPassword() {
		return password != null && !password.isEmpty();
	}
	
	// 삭제 시에 비밀번호를 비교함.
	public boolean matchPassword(String pw) {
		return hasPassword() && password.equals(pw);
	}
	
}
