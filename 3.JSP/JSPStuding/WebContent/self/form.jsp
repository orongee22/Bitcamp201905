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
	<form action="request.jsp" method="post">
		아이디<input type="text" name="userID">
		비밀번호<input type="password" name="userPW">
		<input type="submit" value="등록">
		
	</form>
</body>
</html>