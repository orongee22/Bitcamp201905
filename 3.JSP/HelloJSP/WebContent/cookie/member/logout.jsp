<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	
	// 쿠키 삭제 => 유효시간을 0으로 하면 생성하자마자 자동소멸!
	// 값도 "" 비어있게 만들어서 null처리
	Cookie c1 = CookieBox.createCookie("LOGIN","",0);
	response.addCookie(c1);
	
	Cookie c2 = CookieBox.createCookie("ID","",0);
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

	<h1>로그아웃 되었어요~!</h1>
	<a href="loginForm.jsp">로그인 화면으로 돌아가기</a>
</body>
</html>