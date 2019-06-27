<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- true값으로 지정하면 error페이지를 지정할 수 있음. 현재 파일을 에러페이지로 만드는 지시어 -->
<%@ page isErrorPage="true" %>
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
	<h1>요청하신 처리 내용 중 오류가 발생했습니다.(500)<br> 빠른 시간 안에 복구하겠습니다 ㅠㅠ</h1>
	<!-- getContextPath() 현재 루트의 값을 반환함. -> localhost:8080/apps -->
	<a href="<%=request.getContextPath()%>">홈으로 이동</a>
	
</body>
</html>