<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 쿠키를 등록! (= 쿠키를 구움ㅋㅋㅋㅋㅋㅋㅋ)
	// Cookie 객체를 생성 : new Cookie("쿠키이름", "데이터");
	
	Cookie cookie = CookieBox.createCookie("code", "0");
	response.addCookie(cookie);
	
	Cookie c1 = CookieBox.createCookie("name", "예리나");
	response.addCookie(c1);
	
	Cookie c2 = CookieBox.createCookie("nickname","에리짱", 1800);
	response.addCookie(c2);
	
	Cookie c3 = CookieBox.createCookie("pw", "1234", 7200);
	response.addCookie(c3);
	
%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>e
</style>
</head>
<body>
	<h1>쿠키를 생성했습니다.</h1>
	<a href="viewCookie2.jsp">viewCookie로 이동</a>
	<a href="viewCookie-js.jsp">viewCookie-js로 이동</a>
</body>
</html>