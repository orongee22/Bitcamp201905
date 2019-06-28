<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<jsp:useBean id="loginInfo" class="member.MemberInfo" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../frame-el/default.css" rel="stylesheet" type="text/css"><script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
</style>
</head>
<body>
	<!-- 해더 시작 -->
	<%@ include file="../frame-el/header.jsp" %>
	<!-- 해더 끝 -->
	
	<!-- 네비게이션 시작 -->
	<%@ include file="../frame-el/nav.jsp" %>
	<!-- 네비게이션 끝 -->
	
	<div id="contents">
		<h3>마이 페이지</h3>
		${LoginInfo. }
	</div>
	
	<!-- 푸터 시작 -->
	<%@ include file="../frame-el/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>