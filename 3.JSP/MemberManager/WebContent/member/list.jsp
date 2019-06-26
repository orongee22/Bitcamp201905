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

</head>
<body>
<%
	while(e.hasMoreElements()){
		String name = e.nextElement();
		Object obj = application.getAttribute(name);
		
		if(obj instanceof MemberInfo){
			out.println(name+obj+"<br>");
		}
		out.println(e.nextElement()+"<br>");
	}
%>
</body>
</html>