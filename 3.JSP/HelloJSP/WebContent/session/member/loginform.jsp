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
	<h1>로그인</h1>
	<hr>
	<form action="login.jsp" method="post">
		ID : <input type="text" name="uId"><br>
		PW : <input type="text" name="uPw"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>