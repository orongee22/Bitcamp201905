<%@page import="java.util.Enumeration"%>
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
	<!-- web.xml 속 param-name값을 가져오면 param-value값을 반환. -->
	<%= application.getInitParameter("logEnabled") %><br>
	<%= application.getInitParameter("debugLevel") %><br>
	<%
		Enumeration initParamNames = application.getInitParameterNames();
		
	while(initParamNames.hasMoreElements()){
		// toString 오버라이딩..웅앵..?
		out.print(initParamNames.nextElement()+"<br>");
	}
	%>
</body>
</html>