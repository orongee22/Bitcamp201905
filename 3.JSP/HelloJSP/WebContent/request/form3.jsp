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
	<h1>action:forward / response sendRedirect</h1>
	<form action="action_forward.jsp">
		forward action<input type="text" name="name"><input type="submit">
	</form>
	
	<form action="response_sendredirect.jsp">
		response sendRedirect<input type="text" name="name"><input type="submit">
	</form>
	
	
	
</body>
</html>