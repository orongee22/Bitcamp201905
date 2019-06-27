<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// 쿠키 이름이 name과 같다면 데이터를 변경할 것!
	// 기존 이름의 쿠키 객체를 생성 - 새로운 데이터로 등록.
	
	// Cookie c1 = new Cookie("name","예리나");
	
	//response.addCookie(c1);
	
	
	Cookie c = CookieBox.createCookie("name","에리나");
	response.addCookie(c);
	
	Cookie c1 = CookieBox.createCookie("code","one");
	response.addCookie(c1);
	
	
	//Cookie c2 = new Cookie("code", "zero");
	//response.addCookie(c2);
	
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
<h1>쿠키 정보가 변경되었습니다~!~!~!!~!</h1>
<a href="viewCookie2.jsp">viewCookie로 이동</a>
</body>
</html>