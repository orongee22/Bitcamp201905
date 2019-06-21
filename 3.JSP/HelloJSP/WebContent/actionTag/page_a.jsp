<%@ page import="member.Member" %>
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
<h1>
<% 
	// member클래스 받아와야함
	Member member = (Member)request.getAttribute("result");
%>

<%= member %><br>
아이디 : <%= member.getId() %>
이름 : <%= member.getName() %>
번호 : <%= member.getpNum() %>
<a href="../session/viewSession.jsp">sessionView</a>
<!-- no 파라미터 값 : <%= request.getParameter("no") %>-->
<br>
<!--  uname 파라미터 값 : <%= request.getParameter("uname") %> -->
</h1>
</body>
</html>