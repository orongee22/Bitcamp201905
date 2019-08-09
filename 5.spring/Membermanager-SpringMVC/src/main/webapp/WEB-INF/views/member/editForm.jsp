<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
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
	<h3>회원 수정 페이지</h3>
	<hr>
	<!-- 파일 업로드 할때 post방식은 필수. 파일을 넘겨주기 위해선 현재 타입이 multipart여야만 가능하다. 이 형식으로 들어오지 않으면 안됨. -->
	<form method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td>
				<input type="hidden" name="uId" value="${loginInfo.uId}" required>
				${loginInfo.uId}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPW" value="" required> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName" value="${loginInfo.uName}" required> </td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" value="${loginInfo.uPhoto}" name="uPhoto"> </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="수정"> </td>
			</tr>
		</table>
	</form>
</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>