<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
	// 데이터를 받을 때 인코딩 형식을 지정하는 거임.
	// 상단의 pageEncoding은 응답하는 데이터의 인코딩 형식을 지정하는 거고, 이건 요청받은 데이터를 받았을 때!
	// 이거 없으면 한글 깨져 보이니까 반드시 필요필요필요
	request.setCharacterEncoding("utf-8");
%>
	<h1>요청 파라미터 출력하기</h1>
	<h3>request.getParameter() 이용하기</h3>
	<ul>
		<li>name 파라미터 : <%= request.getParameter("name") %></li>
		<li>address 파라미터 : <%= request.getParameter("address") %></li>
		<li>pet 파라미터 : <%= request.getParameter("pet") %></li>
	</ul>
	
	<h3>request.getParameterValues()이용하기</h3>
	<% 
	
		String[] values = request.getParameterValues("pet");
		
		// values의 값이 있을 때만 반복 가능.
		if(values != null && values.length>0){
			
	%>
	<ul>
		<% for(int i=0;i<values.length;i++){
			
		%>
		<li><%= values[i] %></li>
		<%
			}
		%>
	</ul>
	<%
		}
	%>
	
	<h3>getParameterNames()</h3>
	<%
		Enumeration params = request.getParameterNames();
		
		while(params.hasMoreElements()){
			// nextElement = object라서 문자열로 형변환 해조야함
			String pName = (String)params.nextElement();
	%>
	<%= pName%><br>
	<% } %>
	
	<h3>request.getParameterMap() :</h3>
	
	<%
		Map parameterMap = request.getParameterMap();
		String[] nameParam = (String[])parameterMap.get("name");
		
		if(nameParam != null){
	%>
		name =<%= nameParam[0] %>
	<%
		}
	%>
</body>
</html>