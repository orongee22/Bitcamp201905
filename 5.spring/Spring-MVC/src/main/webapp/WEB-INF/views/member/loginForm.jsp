<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼 :: Spring MVC</title>
</head>
<body>
<form action="loginOk" method="post">
	<h1>LoginForm</h1><hr>
	아이디 : <input type="text" name="uId"><br>
	비밀번호 : <input type="password" name="uPw"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>