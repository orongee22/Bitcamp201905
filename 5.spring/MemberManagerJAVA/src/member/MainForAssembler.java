package member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class MainForAssembler {
	private static Assembler assembler = new Assembler();
	// assembler에서 샏성한 인스턴스를 getter로 통해 전달받음.
	private static MemberRegisterService registerService = assembler.getRegistService();
	
	
	public static void main(String[] args) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		while(true) {
			System.out.println("명령어를 입력해주세요.");
			// 한 줄 단위로 읽어오는 메소드.
			String command = reader.readLine();
			if(command.equalsIgnoreCase("exit")) {
				System.out.println("종료합니다.");
				break;
			}
			
			// startsWith : 특정 문자열로 시작하는지 확인.
			if(command.startsWith("new ")) {
				// split : 특정 첨자를 통해 문자를 끊어냄. 
				// 띄어쓰기에 따라서 문자열을 반환
				processNewCommand(command.split(" "));
			}
			if(command.startsWith("change ")) {
				processChangeCommand(command.split(" "));
			}
		}
	}
	
	private static void processNewCommand(String[] args) {
		if(args.length != 5) {
			printHelp();
			return;
		}
		
		MemberRegisterService service = assembler.getRegistService();
		
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
		
		ChangePasswordService service = assembler.getPwService();
		
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
