<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 스크립트 영역 : 자바코드 작성 가능
	String str = new String("회원가입 창");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
img{
	width: 200px;
}

</style>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
</style>
</head>
<body>
<h1><%= str %></h1>
<!-- / => localhost:8080 서버를 기준으로 가리킴 -->
<a href="/apps/member/list.jsp">회원 리스트</a><br>
<img alt="이미지" src="/apps/images/insta.png">
<!-- 주소가 바뀔 경우가 있다면 상대경로를 쓰는 편이 좋음 절대경로는 깨질 위험 많음 ㅇㅇ -->
<script>

$(document).ready(function(){
	alert("회원가입 페이지 입니다.");
});
</script>
</body>
</html>