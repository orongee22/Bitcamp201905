<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- pageEncoding = 사용자에게 응답할 텍스트 인코딩 설정 -->
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
	<h1>시간</h1>
	<p>
		<%= new String("Test") %><br>
		<!-- `=`는 println 역할을 한다. 표현식임. println(new String("Test"))와 똑같은 기능. -->
		<%= new java.util.Calendar() %>
		
	</p>
</body>
</html>