<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<c:set var="now" value="<%= new java.util.Date() %>" />	
		<fmt:formatDate value="${now}" type="date" dateStyle="full" /><br>
		<fmt:formatDate value="${now}" type="date" dateStyle="short" /><br>
		<fmt:formatDate value="${now}" type="time" /><br>
		<fmt:formatDate value="${now}" type="time" timeStyle="full"/><br>
		<fmt:formatDate value="${now}" type="time" timeStyle="short"/><br>
		<fmt:formatDate value="${now}" type="both" /><br>
		<fmt:formatDate value="${now}" type="both" pattern="yyyy/mm/dd mm:ss" /><br>
	</h3>
	<hr>
	<h3>
		<c:set var="price" value="100000" />
		<c:set var="pi" value="3.141592" />
		<fmt:formatNumber value="${price}" type="number" var="numberType" groupingUsed="true"/>
		
		현재 숫자 : ${numberType}
		통화 : <fmt:formatNumber value="${price}" type="currency" currencySymbol="\\" />
		% 표현 : <fmt:formatNumber value="${price}" type="percent" />
		<fmt:formatNumber value="${pi}" type="percent" />
		
		패턴표현 : <fmt:formatNumber value="${price}" pattern="00000000.00"/>
		<fmt:formatNumber value="${pi}" pattern="00000000.00"/>
	</h3>
</body>
</html>