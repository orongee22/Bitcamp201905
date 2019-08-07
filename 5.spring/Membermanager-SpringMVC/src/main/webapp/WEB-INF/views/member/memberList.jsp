<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
<style>
	table,tr,td{
		border: 1px solid #bbb;
		border-collapse: collapse;
		padding: 3px 5px;
	}
	#pagingBox::after{
		display: block;
		clear: both;
		content:'';
	}
	#pagingBox>div{
		float:left
	}
	
	div.searchBox{
		margin: 15px 0;
		width: 500px;
		padding: 15px;
		border: 1px solid #bbb;
	}
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>회원 리스트</h3>
	<hr>
	<div class="searchBox">
		<form>
			검색<br>
			<select name="searchType">
				<option value="both">아이디 + 이름</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="keyword"><input type="submit" value="검색">
		</form>
	</div>
	<table>
		<tr>
			<td>no</td> 
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>사진</td>
			<td>가입일</td>
		</tr>
		<c:forEach items="${viewData.memberList}" var="memberInfo" varStatus="stat">
			<tr>
			<td>${viewData.no-stat.index}</td>
			<td>${memberInfo.uId}</td>
			<td>${memberInfo.uPW}</td>
			<td>${memberInfo.uName}</td>
			<td><img src="<c:url value='/uploadfile/userphoto/${memberInfo.uPhoto}' />" width="100"></td>
			<td><fmt:formatDate value="${memberInfo.regDate}" pattern="yyyy.MM.dd"/></td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${viewData.totalCount>0}">
		<div id="pagingBox">
			<div>
			<div>${viewData.pageTotalCount}</div>
			
				<c:forEach begin="1" end="${viewData.pageTotalCount}" var="num">
				<a href="memberList?searchType=${param.searchType}&keyword=${param.keyword}&page=${num}">${num}</a>
				</c:forEach>
			</div>
		</div>
	</c:if>
	
</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->









</body>
</html>