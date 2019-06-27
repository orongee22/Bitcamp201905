<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../frame/default.css" rel="stylesheet" type="text/css">
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>
<!-- 동적인 걸 원한다면 action을 사용 / 정적인 걸 원한다면 include사용  -->
<!-- header 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->
<!-- navigation 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- navigation 끝 -->
<!-- contents 시작 -->
<div id="contents">
	<h1>로그인 페이지입니다.</h1>
	<hr>
	<form action="loginProcess.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uId" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPw" required></td>
			</tr>
				<td></td>
				<td>아이디 저장<input type="checkbox"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</div>
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>