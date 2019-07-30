package member;

import java.util.Date;

public class Member {
	
	private Long id;
	private String email;
	private String password;
	private String name;
	private Date regDate;
	
	public Member(String email, String password, String name, Date regDate) {
		/* this.id = id; */
		this.email = email;
		this.password = password;
		this.name = name;
		this.regDate = regDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public Date getRegDate() {
		return regDate;
	}
	
	public void changePw(String oldPw, String newPw) throws IdPasswordNotMatchingException {
		if(!this.password.equals(oldPw)) {
			throw new IdPasswordNotMatchingException();
		}
		this.password = newPw;
	}
	
}
