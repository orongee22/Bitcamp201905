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
	<h1>메시지 삭제 비밀번호 확인</h1>
	<form action="deleteMessage.jsp" method="post">
		메시지를 삭제하려면 비밀번호를 입력하세요.<br>
		<!-- 프로그램 내부에서 비밀번호 입력칸과 DB에서 매칭할 Id값을 찾아야 하기 때문에
		숨겨놓고 name값을 준다 -->
		<input type="hidden" name="messageId" value="<%= request.getParameter("messageId")%>">
		비밀번호 <input type="password" name="password" required><br>
		<input type="submit" value="메시지 삭제">
	</form>
</body>
</html>