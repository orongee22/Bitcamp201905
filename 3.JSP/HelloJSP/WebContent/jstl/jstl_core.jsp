<%@page import="java.util.ArrayList"%>
<%@page import="member.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" url="http://java.sun.com/jsp/jstl/core" %>
<%
	List<Member> list = new ArrayList<Member>();

	list.add(new Member("guuguu","구구","010-9999-9999"));
	list.add(new Member("guuguu1","구구1",null));
	list.add(new Member("guuguu2","구구2","010-9999-9999"));
	list.add(new Member("guuguu3","구구3","010-9999-9999"));
	list.add(new Member("guuguu4","구구4","010-9999-9999"));
	list.add(new Member("guuguu5","구구5","010-9999-9999"));
	list.add(new Member("guuguu6","구구6","010-9999-9999"));
	list.add(new Member("guuguu7","구구7","010-9999-9999"));
	list.add(new Member("guuguu8","구구8","010-9999-9999"));
	
	application.setAttribute("list", "list");
	
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
		<c:out value="${param.core}" escapeXml="false">
			<span style="color:red">BBB</span>
		</c:out>
	</h3>
	<hr>
	<table>
		<tr>
			<td>이름</td><td>아이디</td><td>번호</td>
		</tr>
		<c:forEach items="${members}" var="member">
		<!-- var="member"는 member객체를 가리킴. -->
			<tr></tr>
		</c:forEach>
	</table>
</body>
</html>