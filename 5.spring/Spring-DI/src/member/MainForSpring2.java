package member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainForSpring2 {
	
	
	// 스프링 컨테이너 생성 : 조립기 설정파일 appCtx5.xml
	private static ApplicationContext ctx = new GenericXmlApplicationContext("classpath:appCtx5.xml");
	
	public static void main(String[] args){
		
		// # 빈 객체는 싱글톤을 default값으로 인스턴스를 생성한다. 
		System.out.println("스프링 컨테이너에서 받은 객체");
		System.out.println("MemberRegisterService");
		MemberRegisterService registerService1 = ctx.getBean("registService",MemberRegisterService.class);
		MemberRegisterService registerService2 = ctx.getBean("registService",MemberRegisterService.class);
		
		// 참조변수 비교하기. 주소값이 같은 지 판별
		boolean chk = registerService1 == registerService2;
		System.out.println("registerService1 == registerService2 : " + chk);
		System.out.println("=============================================");
		
		// # scope설정을 prototype으로 설정한다면?
		System.out.println("스프링 컨테이너에서 받은 객체");
		System.out.println("MemberRegisterService");
		
		ChangePasswordService passwordSerivce1 = ctx.getBean("changePwService",ChangePasswordService.class);
		ChangePasswordService passwordSerivce2 = ctx.getBean("changePwService",ChangePasswordService.class);
		
		chk = passwordSerivce1 == passwordSerivce2;
		System.out.println("passwordSerivce1 == passwordSerivce2 : "+chk);
	
	}
	
	private static void processNewCommand(String[] args) {
		if(args.length != 5) {
			printHelp();
			return;
		}
		
		// appCtx1.xml에서 해당 객체를 getBean을 통해 받아올 수 있음.
		// 가져오는 이름은 설정해둔 식별자 id와 동일해야 한다. 객체가 아닌 반환 타입을 내가 따로 설정할 수도 있음. class 타입으로 가져올 예정
		MemberRegisterService service = ctx.getBean("registService", MemberRegisterService.class);
		
		RegisterRequest request = new RegisterRequest();
		
		// args = new, 이메일, 사용자이름, 암호, 암호다시확인
		request.setEmail(args[1]);
		request.setName(args[2]);
		request.setPassword(args[3]);
		request.setConfirmPassword(args[4]);
		
		System.out.println(args[3]);
		
		if(!request.isPasswordEqualToConfirmPassword()) {
			System.out.println("암호 확인이 일치하지 않습니다");
			return;
		}
		
		
		try {
			service.regist(request);
			System.out.println("등록되었습니다.");
		} catch (AlreadyExistingMemberException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("이미 존재하는 이메일입니다.");
		}
	
	}
	
	private static void processChangeCommand(String[] args) {
		if(args.length!=4) {
			printHelp();
			return;
		}
		
		ChangePasswordService service = ctx.getBean("changePwService", ChangePasswordService.class);
		
		try {
			service.changePassword(args[1], args[2], args[3]);
			System.out.println("암호가 변경되었습니다.");
		} catch (MemberNotFoundException e       ) {
			System.out.println("존재하지 않는 이메일입니다.");
			e.printStackTrace();
		} catch(IdPasswordNotMatchingException e) {
			System.out.println("이메일과 암호가 일치하지 않습니다.");
		}
		
	}
	
	private static void printHelp() {
		System.out.println("");
		System.out.println("잘못된 명령입니다. 아래 명령 사용법을 확인하세요.");
		System.out.println("new 이메일 사용자이름 암호 암호다시확인");
		System.out.println("change 이메일 현재암호 새로운암호");
	}
}
