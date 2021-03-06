<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../frame-el/default.css" rel="stylesheet" type="text/css">
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>
<!-- 동적인 걸 원한다면 action을 사용 / 정적인 걸 원한다면 include사용  -->
<!-- header 시작 -->
<%@ include file="frame-el/header.jsp" %>
<!-- header 끝 -->
<!-- navigation 시작 -->
<%@ include file="frame-el/nav.jsp" %>
<!-- navigation 끝 -->
<!-- contents 시작 -->
<div id="contents">
	<h1>로그인 요청 처리 페이지입니다.</h1>
	<c:if test="${loginInfo !=null}">
		<c:forEach items="${loginInfo}" var="loginInfo">
		<div>
		메시지 번호 : ${loginInfo.uId}<br> 님 환영합니다.
		</div>
	
	
	</c:forEach>
	</c:if>
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="frame-el/footer.jsp" %>
<!-- footer 끝 -->




</body>
</html>