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

<h1>교수님 과제 제출합니다</h1>
<hr>
<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
	이름 : <input type="text" name="uName"><br>
	학번 : <input type="text" name="sNumber"><br>
	파일 : <input type="file" name="report"><br>
	<input type="submit" value="업로드">
	
</form>
</body>
</html>