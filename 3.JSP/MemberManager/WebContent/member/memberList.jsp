<%@page import="member.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	Enumeration<String> e = application.getAttributeNames();
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
		
		<%	
			
			while(e.hasMoreElements()){
				int cnt = 0;
				String name = e.nextElement();
				Object obj = application.getAttribute(name);
			
				if(obj instanceof MemberInfo){
					MemberInfo member = (MemberInfo)obj;
		%>
					<tr>
						<td><%= ++cnt %></td>
						<td><%= member.getuId() %></td>
						<td><%= member.getuName() %></td>
						<td><%= member.getuPw() %></td>
						<td><img class="thumbnail" src="../images/<%= member.getuPhoto() %> alt="회원 사진"></td>
						<td><a href="#">수정</a> | <a href="#">삭제</a></td>
					</tr>
		<% 
		
		%>
		<%		}
			}
		%>
		
		<!-- 리스트 반복 종료 -->
	</table>
</div>
<!-- contents 끝 -->
<!-- footer 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>