<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<%
		session = request.getSession(false);
	%>
	
	name : <%= session.getAttribute("name") %>
	ID : <%= session.getAttribute("id") %>
	isLogin : <%= session.getAttribute("islogin") %>
	age : <%= session.getAttribute("age") %>
</body>
</html>