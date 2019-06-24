<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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

	<!-- 
	
		파라미터에 값이 전달되지 않으면 null이 나옴!
		null값이 담긴다면 nullpointexception이 뜨겠지?
		예외를 일부러 만들거임!~!
		내부적 예외 오류는 모두 500번대 에러페이지가 뜰거임!
		
	 -->
	name 파라미터 값 : <%= request.getParameter("name").toUpperCase() %>
	
</body>
</html>