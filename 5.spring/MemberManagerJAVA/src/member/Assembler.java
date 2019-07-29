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
		registService = new MemberRegisterService(memberDao);
		pwService = new ChangePasswordService(memberDao);
	}

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
