<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
	// session의 값은 스트링? ㄴㄴ object타입으로 들어감.
	// 해당 타입으로 형변환이 필요쓰
	// 세션 저장되어있는 로그인된 아이디 정보를 가져오기. 그래야 쓸수있잖아....ㅇㅋ?
	// String userId = (String)session.getAttribute("loginId");

	LoginInfo loginInfo = (LoginInfo)session.getAttribute("LoginInfo");
%>
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
	// null이 아니라면 로그인이 되어있다는 상태고 아니라면 그 반대 없다는 뜻이겠지 모
	if(loginInfo != null){
	%>
	<h1><%= loginInfo.getName() %>님은 로그인 상태입니다.</h1>
	<h3>id = <%=loginInfo.getId()%></h3>
	<h3>nickname = <%=loginInfo.getNickname() %></h3>
	<a href="logout.jsp">로그아웃</a>
	<%		
		} else {
	%>
	<script>
		alert('로그인을 하셔야 볼 수 있는 페이지입니다. \n 로그인 페이지로 이동합니다.');
		// 알림띄우고 페이지 이동시키기.
		// 보통은 이런식으로 하고 forward 써도 됨.
		location.href="loginform.jsp";
	</script>
	<% } %>
</body>
</html>