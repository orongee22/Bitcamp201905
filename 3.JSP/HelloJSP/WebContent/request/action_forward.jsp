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
응답 페이지

<%
	request.setAttribute("code","code-0");
%>

</body>
</html>

<jsp:forward page="form3_result.jsp">
	<jsp:param value="A-Type" name="type"/>
	<jsp:param value='<%=request.getParameter("name") %>' name="name" />
	
</jsp:forward>