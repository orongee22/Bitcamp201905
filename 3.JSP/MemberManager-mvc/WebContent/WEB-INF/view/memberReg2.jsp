<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<!-- header 시작 -->
<%@ include file="frame-el/header.jsp" %>
<!-- header 끝 -->
<!-- navigation 시작 -->
<%@ include file="frame-el/nav.jsp" %>
<!-- navigation 끝 -->
<!-- contents 시작 -->
<div id="contents">
	<h1>회원가입 페이지 입니다.</h1>
	<h2>${result}</h2>
	<hr>
	
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="frame-el/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>