package member;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Scope;

// 자바 코드를 이용한 DI

@Configuration // 설정파일임을 명시해주는 어노테이션
//@Import() // 추가하고자 하는 클래스를 같이 설정해줄 수 있음.
@ComponentScan(basePackages = "member")
// <context:component-scan base-package="member" /> 와 똑같음
public class AppCtx3 {


	/*
	 * @Bean(name = "registService2") public MemberRegisterService2
	 * getMemberRegisterService2() { // setter 메소드를 통한 주입 MemberRegisterService2
	 * service = new MemberRegisterService2(); //
	 * service.setMemberRegisterService(getMemberDao()); return service;
	 * 
	 * // 생성자를 통한 dao주입 // 위에서 생성한 Dao메소드를 생성자 매개변수로 넣어줌 //return new
	 * MemberRegisterService2(getMemberDao());
	 * 
	 * }
	 * 
	 * @Bean(name = "changePwService2") public ChangePasswordService2
	 * getChangePasswordService2() { ChangePasswordService2 service = new
	 * ChangePasswordService2(); //
	 * service.setChangePasswordService2(getMemberDao()); return service; }
	 */
}
