package member;

import java.util.Date;

public class MemberRegisterService {
	private MemberDao memberDao;
	
	public MemberRegisterService(MemberDao dao) {
		this.memberDao = dao;
	}
	
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
