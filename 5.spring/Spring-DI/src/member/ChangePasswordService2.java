package member;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("changePwService")
public class ChangePasswordService2 {
	// new 키워드를 통해 새로운 객체를 직접 생성하지 않는다.
	// 생성자를 통해 객체를 주입받는다.
	//private MemberDao memberDao = new MemberDao();
	
	// autowired 어노테이션을 사용하면, 컨테이너가 자동으로 객체를 주입시켜준다. 내가 따로 등록하지 않아도 가능
	@Autowired
	//@Resource(name="memberDao2")
	private MemberDao memberDao; // 아무값이 없으니 현재 null값
	
	
	public void setChangePasswordService2(MemberDao dao) {
		this.memberDao = dao;
	}
	/*
	 * public ChangePasswordService(MemberDao dao) { memberDao = dao; }
	 */
	
	// 비밀변호 변경 메소드. 변경하고자 하는 email과 변경 전 비밀번호, 변경 후 비밀번호를 매개변수로 받아 처리한다.
	public void changePassword(String email, String oldPw, String newPw) throws MemberNotFoundException, IdPasswordNotMatchingException {
		Member member = memberDao.selectByEmail(email); // email을 통해 Member객체를 반환하는 메소드
		
		
		// 만약 email을 통해 member객체를 가져오지 못했다면 exception처리
		if(member == null) {
			throw new MemberNotFoundException();
		}
		member.changePw(oldPw, newPw);
		
		memberDao.update(member);
	}
	
	
	
}
