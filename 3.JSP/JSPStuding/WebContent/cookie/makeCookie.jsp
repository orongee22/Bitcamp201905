<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 쿠키를 등록! (= 쿠키를 구움ㅋㅋㅋㅋㅋㅋㅋ)
	// Cookie 객체를 생성 : new Cookie("쿠키이름", "데이터");
	
	Cookie c2 = new Cookie("code", "ace");
	
	response.addCookie(c2);
	
	Cookie c1 = new Cookie("name","예리나");
	response.addCookie(c1);
	
	Cookie c3 = new Cookie("id","cool");
	c3.setMaxAge(60); // 1분동안 유지
	response.addCookie(c3);
	
	Cookie c4 = new Cookie("email","yerina@naver.com");
	c4.setMaxAge(3600); // 1시간동안 유지
	response.addCookie(c4);
%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
</style>
</head>
<body>
	<h1>쿠키를 생성했습니다.</h1>
	<a href="viewCookie.jsp">viewCookie로 이동</a>
</body>
</html>