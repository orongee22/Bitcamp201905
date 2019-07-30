package member;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class MemberRegisterService {
	
	// required가 false라면 인스턴스 주입을 받지 않음. 기본값은 true값.
	// 현재 인스턴스 생성은 가능하지만 memberDao는 null값이 들어올 것임.
	@Autowired(required = false)
	//@Qualifier("sys")
	//@Resource(name = "memberDao1")
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	/*
	 * public MemberRegisterService(MemberDao dao) { this.memberDao = dao; }
	 */
	
	public void regist(RegisterRequest request) throws AlreadyExistingMemberException {
		Member member = memberDao.selectByEmail(request.getEmail());
		
		if(member!=null) {
			// 현재 member가 존재한다면 중복가입을 막기 위해 예외처리를 한다.
			throw new AlreadyExistingMemberException();
		}
		
		Member newMember = new Member(request.getEmail(),request.getPassword(),request.getName(),new Date());
		
		memberDao.insert(newMember);
	}
	
}
