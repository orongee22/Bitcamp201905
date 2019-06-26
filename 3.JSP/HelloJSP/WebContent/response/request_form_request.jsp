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
	*{
		padding: 0;
		margin: 0;
	}
	h1{
		font-size: 24px;
		text-align: center;
	}
	
	
	table{
		width: 500px;
		margin: 0 auto;
		border: 0;
		border-collapse: collapse;
	}
	td{
		border: 1px solid #ddd;
		padding: 10px;
	}
	
	input[type="text"],select{
		height: 25px;
	}
	table tr:first-child>td:first-child{
		width: 150px;
	}
	
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("id");
	String job = request.getParameter("job");
	String[] inter = request.getParameterValues("interest");
%>
	<div id="wrapper">
	<h1>전송결과</h1>
	<hr>
	<form>
		<table>
			<tr>
				<td>이름</td>
				<td>
				<%= request.getParameter("id") %>
				
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
				<%= request.getParameter("job") %>
				</td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td>
					<% 
						if(inter != null){
							for(int i=0;i<inter.length;i++){
								out.println(inter[i]+"<br>");								
							}
						}
					%>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>