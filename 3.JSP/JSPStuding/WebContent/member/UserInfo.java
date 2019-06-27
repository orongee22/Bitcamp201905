package member;

import java.util.Date;

public class UserInfo {
	// beans 클래스의 변수는 모두 private 처리!
	
	private String id; // ${user.id} --> 변수 호출이 아니고 getId() 메소드 호출한 거와 같음. private처리해서 접근 불가한거 RGRG?
	public UserInfo(String id, String password, String name, String address, String email) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.email = email;
		this.registerDate = new Date();
	}
	
	public UserInfo() {
		// 인스턴스 생성될 때 만들어지는 거니까 그때의 시간을 담을 것임~!
		this.registerDate = new Date();
	}
	private String password;
	private String name;
	private String address;
	private String email;
	private Date registerDate;
	// 기본 생성자는 필수로 만들어줘야함....
	// 필드를 이용하는 생성자가 필요하다면? default 생성자를 명시적으로 정의해줘야함.
	
	// setter / getter 메소드 정의
	
	// getVariable() / setVariable()
	// getValue() / setValue()
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	
}
