<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String ctgy = request.getParameter("ctgy");

	if(ctgy == null){
		ctgy = "1";
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
	*{
		margin: 0;
		padding: 0;
	}
	#main_wrap{
		margin: 10px auto;
		padding: 10px;
		width: 800px;
		border: 1px solid #ddd;
	}
	#wrap::after{
		display: block;
		clear: both;
		content:'';
	}
	#wrap>div{
		float: left;
	}
	#menu{
		width: 200px;
		height: 200px;
	}
	#aside{
		width: 500px;
		height: 200px;
		background-color: blue;
	}
	#footer{
		height: 50px;
		border: 1px solid #ddd
	}
	
</style>
</head>
<body>
<div id="main_wrap">
	<div id="header">
		<h1>title</h1>
	</div>
	<div id="wrap">
		<div id="menu">
			<jsp:include page="menu.jsp">
				<!-- <jsp:param value='<%= request.getParameter("ctgy") %>' name="ctgy" /> -->
				<jsp:param value="<%= ctgy %>" name="ctgy"/>
			</jsp:include>
		</div>
		<div id="aside"></div>
	</div>
	<div id="footer"></div>
</div>
</body>
</html>