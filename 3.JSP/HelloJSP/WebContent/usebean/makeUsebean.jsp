<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<jsp:useBean id="userInfo" class="member.UserInfo"/>

<!--
	1. 해당 영역(page)에 userInfo라는 이름의 member.UserInfo타입 객체가 있는지 확인부터 함.
	2. 있다면 현재 저장되어 있는 객체 반환
	3. 없다면 UserInfo ui = new member.UserInfo(); 생성 = 새로운 객체 생성
		3-1. pageContext.setAttribute("userInfo", ui);
  -->
<jsp:setProperty property="name" value="hot" name="userInfo"/>
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
		userInfo.setId("cool");
	%>
	<%= userInfo.getId() %><br>
	<%= userInfo.getName() %>

</body>
</html>