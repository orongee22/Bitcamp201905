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
<% 
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("uId"); 
	String userPw = request.getParameter("uPw");
	String userName = request.getParameter("uName");
	
%>
<!-- 동적인 걸 원한다면 action을 사용 / 정적인 걸 원한다면 include사용  -->
<!-- header 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->
<!-- navigation 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- navigation 끝 -->
<!-- contents 시작 -->
<div id="contents">
	<h1>회원가입 요청 정보 페이지 입니다.</h1>
	<hr>
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><input type="email" name="uId" value="<%=userId %>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPw" value="<%=userPw %>"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName" value="<%=userName %>"></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="uPhoto"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</div>
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>