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
	<h3>
	
		request 영역 : ${requestScope.name01}<br>
		session 영역 : ${sessionScope.name02}<br>
		application 영역 : ${applicationScope.name03}<br>
	</h3>
</body>
</html>