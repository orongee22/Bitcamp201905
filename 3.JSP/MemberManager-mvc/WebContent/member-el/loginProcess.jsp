<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
<% 
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("uId"); 
	String userPw = request.getParameter("uPw");
	
	
	if(userId != null && userPw != null && userId.equals("admin") && userPw.equals("1111")){
		// 해당 아이디와 비밀번호와 일치하면 루트 페이지로 가게 하는 거임.
		response.sendRedirect(request.getContextPath());
	}
	
%>
<!-- 동적인 걸 원한다면 action을 사용 / 정적인 걸 원한다면 include사용  -->
<!-- header 시작 -->
<%@ include file="../frame-el/header.jsp" %>
<!-- header 끝 -->
<!-- navigation 시작 -->
<%@ include file="../frame-el/nav.jsp" %>
<!-- navigation 끝 -->
<!-- contents 시작 -->
<div id="contents">
	<h1>로그인 요청 처리 페이지입니다.</h1>
	<hr>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uId" value="<%= userId%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPw" value="<%= userPw%>"></td>
			</tr>
			<tr>
				<td></td>
				<td>아이디 저장<input type="checkbox"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</div>
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="../frame-el/footer.jsp" %>
<!-- footer 끝 -->

<jsp:useBean id="loginInfo" class="member.model.MemberInfo" scope="session"/>
<jsp:setProperty property="uId" name="loginInfo" value="<%= userId %>"/>
<%
	loginInfo.setuPw(userPw);
%>





</body>
</html>