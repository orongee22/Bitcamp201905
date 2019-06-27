<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
	// request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("uId"); 
	String userPw = request.getParameter("uPw");
	
	// boolean loginChk = false;
	
	
	/* if(userId != null && userPw != null && userId.equals("admin") && userPw.equals("1111")){
		// 해당 아이디와 비밀번호와 일치하면 루트 페이지로 가게 하는 거임.
		response.sendRedirect(request.getContextPath());
	} */
	
	// 1. 사용자가 로그인 폼에서 입력한 id로 회원 정보를 검색해서 비교를 할 것임.
	// 2. 있다면? 해당 객체를 받아서 그 안에 pw와 또 비교. -> 또 같다면? 로그인 : 세션영역에 회원 정보를 저장할고임.
	//	     								     없다면? 오류메시지 전달 -> 로그인 페이지로 이동시킴
	// 3. 존재하지 않는 아이디? 오류메시지 전달-> 로그인 페이지로 이동시킴.
			
	MemberInfo memberInfo = (MemberInfo)application.getAttribute(userId);
	
	if(memberInfo !=null && memberInfo.getuPw().equals(userPw)){
		session.setAttribute("loginInfo",memberInfo.toLoginInfo());
		
		response.sendRedirect(request.getContextPath());
	} else {
%>
<script>
	alert("아이디 혹은 비밀번호가 틀립니다.\다시 로그인 해주세요.");
	history.go(-1);
</script>
<%
	}
%>
<%--
=======
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("uId"); 
	String userPw = request.getParameter("uPw");
	
	
	if(userId != null && userPw != null && userId.equals("admin") && userPw.equals("1111")){
		// 해당 아이디와 비밀번호와 일치하면 루트 페이지로 가게 하는 거임.
		response.sendRedirect(request.getContextPath());
	}
	
%>
>>>>>>> gh-pages
<!-- 동적인 걸 원한다면 action을 사용 / 정적인 걸 원한다면 include사용  -->
<!-- header 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->
<!-- navigation 시작 -->
<%@ include file="../frame/nav.jsp" %>
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
<<<<<<< HEAD
				<td><input type="submit" value="로그인"></td>
=======
				<td>아이디 저장<input type="checkbox"><input type="submit" value="로그인"></td>
>>>>>>> gh-pages
			</tr>
		</table>
	</div>
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->

<jsp:useBean id="loginInfo" class="member.MemberInfo" scope="session"/>
<jsp:setProperty property="uId" name="loginInfo" value="<%= userId %>"/>
<%
	loginInfo.setuPw(userPw);
%>





</body>
<<<<<<< HEAD
</html> --%>
</html>
