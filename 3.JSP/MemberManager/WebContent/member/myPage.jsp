<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
	LoginInfo loginInfo = (LoginInfo)session.getAttribute("loginInfo");
	
%>
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
	<%
		if(loginInfo != null){
	%>
	<h3>회원 정보 페이지</h3>
	<hr>
	
		<img src="../images/<%= loginInfo.getuPhoto()%>">
		<h4>이름 : <%= loginInfo.getuName() %></h4>
		<h4>아이디 : <%= loginInfo.getuId() %></h4>
	
	<%--= loginInfo --%>
	<%
		} else {
	%>
	<script>
		alert('로그인 후 이용가능한 페이지 입니다.');
		location.href = 'login.jsp';
	</script>
	<%
		}
	%>
	
</div>
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</html>