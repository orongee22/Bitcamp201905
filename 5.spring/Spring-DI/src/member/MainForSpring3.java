package member;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class MainForSpring3 {

	public static void main(String[] args) {
		// ctx라는 컨테이너에 @configuration를 명시한 설정클래스를 불러옴. 클래스는 매개변수 여러개를 지정해서 불러올 수도 있음.

		ApplicationContext ctx = new AnnotationConfigApplicationContext(AppContext.class);
		
		MemberDao dao1 = ctx.getBean("memberDao",MemberDao.class);
		MemberDao dao2 = ctx.getBean("memberDao",MemberDao.class);
		
		// dao가 싱글톤 객체인 지 확인.
		System.out.println(dao1 == dao2);
	}

}
