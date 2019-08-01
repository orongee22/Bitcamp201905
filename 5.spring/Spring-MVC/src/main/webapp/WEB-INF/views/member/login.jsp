<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 결과 페이지</h1>

<!--  @ModelAttribute("user")를 사용했다면 login이 아니라 user로만 받아올 수 있음. -->
<h3>id = ${id} , ${user.uId}/ pw = ${pw} , ${login.uPw}</h3>
</body>
</html>