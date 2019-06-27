<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setAttribute("name01", "requestData");
	session.setAttribute("name02", "sessionData");
	application.setAttribute("name03","applicationData");
	request.setAttribute("code", "zero");
%>
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
	<h3>
		
		request 영역 : ${name01}<br>
		session 영역 : ${name02}<br>
		application 영역 : ${name03}<br>
		code 파라미터 : ${param.code}<br>
		code 파라미터 (표현식) : <%= request.getParameter("code") %><br>
		contextPath : ${pageContext.request.contextPath}<br>
		contextPath(표현식) : <%= request.getContextPath()%><br>
		
		<a href="${pageContext.request.contextPath}/cookie/makeCookie2.jsp">경로 1</a>
		<a href="<%= request.getContextPath()%>/cookie/makeCookie2.jsp">경로 2</a>
	</h3>
</body>
</html>