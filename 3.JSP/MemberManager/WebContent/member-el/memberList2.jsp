<%@page import="member.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	Enumeration<String> e = application.getAttributeNames();
	// jstl에서 받아 쓸 이름임 = mListName
	application.setAttribute("mListName", e);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../frame/default.css" rel="stylesheet" type="text/css">
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
	img{
		margin: 2px;
		height: 25px;
	}
	table{
		margin: 0 auto;
		width: 80%;
		border: 0;
		border-collapse: collapse;
	
	}
	table td{
		padding: 3px;
		border: 1px solid #bbb;
	}
	
	table tr:first-child>td{
		text-algin: center;
		background-color: #eee;
		font-weight: bold;
	}
</style>
</head>
<body>
<!-- 동적인 걸 원한다면 action을 사용 / 정적인 걸 원한다면 include사용  -->
<!-- header 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->
<!-- navigation 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- navigation 끝 -->
<!-- contents 시작 -->
<div id="contents">
	<h1>회원 리스트입니다.</h1>
	<hr>
	<table>
		<tr>
			<td>순번</td>
			<td>아이디</td>
			<td>이름</td>
			<td>비밀번호</td>
			<td>이미지</td>
			<td>관리</td>
		</tr>
		
		<!-- 리스트 반복 시작 -->
		
		<!-- status의 역할 : 카운트 할 수 있움 -->
		<c:forEach items="${mListName}" var="userId" varStatus="status">
		
		<c:if test="${fn:contains(userId,'@')}" >
		
		<c:set var="member" value="${applicationScope.userId}" />	
		
					<tr>
						<td>${status.count}</td>
						<td>${userId.uId}</td>
						<td>${userId.uName}</td>
						<td>${userId.uPw}</td>
						<td><img class="thumbnail" src="../images/${userId.uPhoto}" alt="회원 사진"></td>
						<td><a href="#">수정</a> | <a href="#">삭제</a></td>
					</tr>
		</c:if>
		</c:forEach>
		<!-- 리스트 반복 종료 -->
	</table>
</div>
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>