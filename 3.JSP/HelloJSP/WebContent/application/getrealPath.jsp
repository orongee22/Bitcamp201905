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
	String path = "/images/1.png";
	// 나중에 폴더를 알아서 생성될 거임 ㅇㅋㅇㅋㅇㅋ
%>

<h1>자원의 실제 경로 : <%= application.getRealPath(path) %></h1>

</body>
</html>