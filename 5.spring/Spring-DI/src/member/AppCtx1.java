package member;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Scope;

// 자바 코드를 이용한 DI

@Configuration // 설정파일임을 명시해주는 어노테이션
//@Import() // 추가하고자 하는 클래스를 같이 설정해줄 수 있음.
public class AppCtx1 {
	
	// bean id="memberDao" 와 같음.
	@Bean(name = "memberDao") //(속성)을 따로 설정할 수도 있다. autowire:타입 혹은 이름으로 매칭 / destroyMethod: 소멸시점
	public MemberDao getMemberDao() {
		return new MemberDao();
	}
}
