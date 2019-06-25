<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// 쿠키 생성하자마자 삭제해버릴거임.
	Cookie c1 = new Cookie("name","");
	// 유효시간을 0초로 만들어 생성과 동시에 바로 소멸!
	c1.setMaxAge(0); // setMaxAge(시간) :  만약 1년 내내로 쿠키를 설정하고 싶다묜? 60*60*24*365
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("code","");
	c2.setMaxAge(0);
	response.addCookie(c2);
	
%>
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
<h1>쿠키 정보가 삭제되었습니다.</h1>
<a href="viewCookie.jsp">viewCookie</a>
<a href="makeCookie.jsp">makeCookie</a>
</body>
</html>