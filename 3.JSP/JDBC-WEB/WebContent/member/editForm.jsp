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
	<h1>사원 이름 수정</h1>
	<hr>
	<form action="editEmp.jsp" method="post">
		<!-- 사원번호를 번호로 받기 위해서 아예 input에서 필터링 시켰음 ㅇㅅㅇ -->
		사원번호 <input type="number" name="empno" required><br>
		사원이름 <input type="text" name="ename"><br>
		<input type="submit" value="수정">
	</form>                                                                                             
</body>
</html>