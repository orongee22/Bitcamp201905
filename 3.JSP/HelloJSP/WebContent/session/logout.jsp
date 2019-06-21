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
<!-- invalidate() 현재 세션을 종료시키는 메소드. -->
<% request.getSession(false).invalidate()%>
<h1>세션을 종료했습니다.</h1>

	<a href="viewSession.jsp">viewSession1</a>
	<a href="../response/viewSession.jsp">response/viewSession1</a>
"
</body>
</html>