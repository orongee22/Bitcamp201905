<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean chk = false;
	
	
	if(id.equals(pw)){
		// id와 pw가 같은 값이면 로그인 성공한거임
		// 맞다면 쿠키를 생성 - 사용자 데이터를 저장할 것!
		
		// -1 주는 이유는 브라우저 종료시 끝내기 위해서!.......ㅎㅎㅎㅎㅎㅎㅎㅎ
		Cookie c1 = CookieBox.createCookie("LOGIN", "SUCCESS", -1);
		response.addCookie(c1);
		
		// ID라는 이름에 input의 값 파라미터를 넣고. 브라우저 종료될 때 끝나게 만들엇슴
		Cookie c2 = CookieBox.createCookie("id", id, -1);
		response.addCookie(c2);
		
		chk = true;
		
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
	if(chk){
		out.println("<h1>로그인 되었습니다.</h1>");
		out.println("<a href=\"loginCheck.jsp\">loginCheck</a>");
	} else{
		out.println("<script>alert(\'로그인 실패\'); history.go(-1);</script>");
	}
%>
</body>
</html>