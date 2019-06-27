<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<style>
img{
	width: 100px;
}
</style>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
</style>
</head>
<body>
<% Calendar c = Calendar.getInstance(); %>
<!-- Calendar는 new 생성자 사용 못함. 무조건 싱글톤으로 처리. -->
<h1>회원 리스트 <%= c.get(Calendar.YEAR) %>년 <%= c.get(Calendar.MONTH)+1 %>월 <%= c.get(Calendar.DATE) %>일</h1>
<a href="memberReg.jsp">회원 가입</a><br>
<img alt="이미지" src="../images/insta.png"><br>
<a href="file.jsp">파일</a>
</body>
</html>