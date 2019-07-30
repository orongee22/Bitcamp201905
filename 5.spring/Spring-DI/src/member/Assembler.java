package member;

public class Assembler {
	// 객체를 생성하고 관리하는 역할을 하는 클래스임.
	// 컨테이너, 조립기의 역할.
	// 외부에서 new 인스턴스를 생성하고 getter를 통해 반환시킨다.
	
	
	// 보관 객체..? 
	private MemberDao memberDao;
	private MemberRegisterService registService;
	private ChangePasswordService pwService;

	public Assembler() {
		// 필요한 객체를 생성하고 주입하는 생성자.
		memberDao = new MemberDao();
		
		// Service객체에서 직접 DAO를 생성하지 않고 생성자로 받아서 사용함.
		// 그래서 매개변수로 DAO를 받음.
		registService = new MemberRegisterService(memberDao);
		pwService = new ChangePasswordService(memberDao);
	}
	
	// 싱글톤 처리 : getter로만 인스턴스에 접근하게 만듦.
	public MemberDao getMemberDao() {
		return memberDao;
	}

	public MemberRegisterService getRegistService() {
		return registService;
	}

	public ChangePasswordService getPwService() {
		return pwService;
	}
	
	
}
