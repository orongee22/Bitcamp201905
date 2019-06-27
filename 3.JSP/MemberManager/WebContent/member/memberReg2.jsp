<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- usebean 액션 테그를 이용한 객체 생성 ( 찾고 -> 없을 때 생성 )  -->
<jsp:useBean id="memberInfo" class="member.MemberInfo"/>

<!-- 생성된 객체에 데이터 바인딩 : 폼의 name 속성과 beans 클래스의 변수 이름이 동일해야한다 !!!!!  -->
<jsp:setProperty property="*" name="memberInfo"/>

<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
	if(memberInfo.getuPhoto() == null){
		memberInfo.setuPhoto("noImage.jpg");
	}
	// 내장객체 안으로 회원정보 객체를 저장함. = application에!
	application.setAttribute(memberInfo.getuId(),memberInfo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../frame/default.css" rel="stylesheet" type="text/css">
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("uId"); 
	String userPw = request.getParameter("uPw");
	String userName = request.getParameter("uName");
	
%>
<!-- 동적인 걸 원한다면 action을 사용 / 정적인 걸 원한다면 include사용  -->
<!-- header 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->
<!-- navigation 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- navigation 끝 -->
<!-- contents 시작 -->
<div id="contents">
	<h1>회원가입 페이지 입니다.</h1>
	<h1>회원가입 요청 정보 페이지 입니다.</h1>
	<hr>
	<%= memberInfo.makeHtmlDiv() %>	
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>