<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setAttribute("member",new Member("papa","guuguuu","010-9999-9999"));
	request.setAttribute("name01", "requestData");
	session.setAttribute("name02", "sessionData");
	application.setAttribute("name03","applicationData");
	pageContext.setAttribute("name04","pageData");
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
	
		request 영역 : ${requestScope.name01}<br>
		session 영역 : ${sessionScope.name02}<br>
		application 영역 : ${applicationScope.name03}<br><br>
		page 영역 : ${pageScope.name04}<br>
		<%-- member 객체 참조 1 - id:${requestScope.member} --%>
		<!-- Map.get("member") 랑 똑같은 형식인거임. -->
		member 객체 참조 1 - id:${requestScope.member.id}<br>
		<!-- 여기서의 id는 변수 id가 아닌 getId() 메소드를 뜻하는 것임. -->
		
		member 객체 참조 2 - name : ${requestScope.member.name}<br>
		member 객체 참조 3 - phonenum : ${requestScope.member.pNum}<br>
		member 객체 참조 4 - num : ${requestScope.member.num }
	</h3>
</body>
</html>