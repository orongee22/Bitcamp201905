package util;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
	// cookie 데이터를 map에 저장하고 관리.
	
	// private처리해서 접근 막기.
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
	
	// 생성자 초기화 -> request 객체에서 Cookie[]를 받아 cookieMap에 저장!
	public CookieBox(HttpServletRequest request) {
		// 전달받은 request 매개변수를 뜻하는거임.
		Cookie[] cookies = request.getCookies();;;
		
		if(cookies != null && cookies.length>0) {
			// 반복처리해서 Cookie객체 Map에 저장....
			for(int i=0;i<cookies.length;i++) {
				Cookie c = cookies[i];
				// key,value 값으로 저장하기 때문에
				// key = 쿠키이름으로 저장. =>getName();
				cookieMap.put(c.getName(),c);
			}
		}
	}
	
	
	// 쿠키를 생성하는 메소드를 만들어보자!
	// 쿠키를 일일히 만들지 않고 메소드 하나만을 이용해서 계속 관리할 수 있겠지!~!!
	
	// 매개변수 : 이름, 데이터
	public static Cookie createCookie(String name, String value) {
		Cookie c = new Cookie(name, value);
		return c;
	}
	
	// createCookie() 오버로딩 처리 할거임.
	
	// 매개변수 : 이름, 데이터, 유효시간
	public static Cookie createCookie(String name, String value, int maxAge) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		return c;
	}
	
	// 매개변수 : 이름, 데이터, 유효시간, 경로
	public static Cookie createCookie(String name, String value, int maxAge, String path) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		c.setPath(path);
		return c;
	}
	
	// 매개변수 : 이름, 데이터, 유효시간, 경로, 도메인
	public static Cookie createCookie(String name, String value, int maxAge, String path, String domain) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		c.setPath(path);
		c.setDomain(domain);
		return c;
	}
	
	
	// 쿠키 정보를 반환하는 메소드
	// Map(CookieBox)에 저장된 데이터를 가져올거임.
	
//	map에 저장된 애들은 static변수 ㄴㄴ 모두 인스턴스 생성해야만 사용할 수 있기 때문에 public만 ㅇㅇ
	// 맵으로 저장되었기에 name값을 통해 값을 가져올거임!
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
		// 가져올 name값이 없다면 null반환함.
	}
	
	// 쿠키의 데이터 반환 메소드  / 쿠키의 데이터가 String으로 저장되기 때문에 반환값도 String 
	public String getValue(String name) {
		Cookie c = cookieMap.get(name);
		// null값이 나온다면 널포인트익셉션 오류 뜨니까 그거 방지하는거임.
		if(c == null) {
//			null값이 나온다면 그대로 종료.
			return null;
		}
		return c.getValue();
	}
	
	// 해당 쿠키가 존재하는 지 아닌 지 확인하는 메소드
	public boolean exists(String name) {
		// name이 null이 아니야! 그치? return하는거
		// 있다면 맞아 true
		// 없다면 ㄴㄴ아냐 false 반환
		return cookieMap.get(name) != null;
	}
	
	
}
