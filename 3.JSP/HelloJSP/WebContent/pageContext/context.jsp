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
	<h1>
		<%
			
			// HttpServlet으로 형변환을 해줘야함...???ㅠㅠ
			HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
		%>
		<!-- 같은 객체를 참조하고 있는 지 알아볼 고임! -->
		<%= request == req	%>
		<% pageContext.getOut.println("같은 객체 참조중.") %>
	</h1>
</body>
</html>