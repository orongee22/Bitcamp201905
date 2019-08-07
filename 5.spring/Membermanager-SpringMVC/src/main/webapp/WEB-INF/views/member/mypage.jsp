<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
</head>
<body>
<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
<!-- 네비게이션 끝 -->
<div id="contents">
	<h1>My Page</h1>
	<!-- 이미지 경로는 uploadfile 경로 안에 저장되어 있음.... ㅇㅋ? -->
	<img src="<c:url value='/uploadfile/userphoto/${loginInfo.uPhoto}'/>" alt="회원사진">
	회원 이름 : ${loginInfo.uName}<br>
	회원 아이디 : ${loginInfo.uId}<br>
	<!-- 푸터 시작 -->
	<div>
		<a href="edit?uId=${loginInfo.uId}">회원 정보 수정</a>
		<a href="deleteConfirm?uId=${loginInfo.uId}">회원 탈퇴</a>
	</div>
</div>
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->

	
</body>
</html>