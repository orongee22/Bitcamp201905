<%@ page import="member.LoginInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
	<!-- 
		1. id/pw 데이터 받기
		2. id == pw 인증
		3. 세션에 사용자 데이터를 저장 : 속성을 이용해서 데이터를 저장함.	
		4. 응답처리 : /로그인 되었습니다./ or /로그인 실패 (이전 페이지로 이동)/	
	 -->
<%
	//사용자에게 요청을 받아올 때 인코딩 타입을 설정하는 것임!
	request.setCharacterEncoding("utf-8");
	
	// 파라미터 값은 객체로 저장쓰
	String id = request.getParameter("uId");
	String pw = request.getParameter("uPw");
	
	boolean loginChk = false;
	
	if(id.equals(pw)){
		// 아이디와 비밀번호가 같다면 로그인 할거야
		// 세션에 사용자 데이터를 저장할 가고 loginChk를 true로!
		loginChk = true;
		
	} else{
		// 같지 않다면 로그인 실패!
	}
	
	if(id!=null && pw !=null && id.equals(pw)){
		// 세션에 저장하는 목적은
		// 사용자가 로그인을 했는지 알아보기 위한 여부 확인.
		//session.setAttribute("loginId", id);
		//session.setAttribute("loginPw", pw);
		
		// loginInfo - 사용자 정보를 가지고있는 데이터 객체
		LoginInfo loginInfo = new LoginInfo(id);
		
		// 인스턴스 세션에 저장~!
		session.setAttribute("LoginInfo",loginInfo);
	}
	
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
	<% 
		if(loginChk){
	%>
	<h1><%= id %>님이 로그인 하셨습니다.</h1>
	<a href="loginCheck.jsp">로그인 확인</a>
	<%	} else { %>
	<script>
		alert("아이디 또는 비밀번호를 확인해 주세요....");
		// sendRedirect와 같은 역할을 한다고 보면됨. 그것도 다른 페이지로 다시 요청해서 보내는 거니까는?
		history.go(-1);
	</script>
	<% } %>
</body>
</html>