<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<% String id = request.getParameter("id");
	String name="예리나";

	if(id != null && id.equals("test")){
		// URL을 통해 보내는 parameter name값을 utf-8 인코딩 형식으로 보내준다.
		// 데이터를 보낼때는 encode 데이터를 받으면 decode를 통해 utf-8형식으로 풀어주는거........
		
		// String newStr = 
		response.sendRedirect("view.jsp?name="+java.net.URLEncoder.encode(name, "utf-8"));
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
<!-- id가 test가 아니라면 index.html로 넘어가지 않기 때문에 인증되지 않았다는 메시지가 뜨도록 한다. -->
<h1>인증 처리된 아이디가 아닙니다.</h1>
</body>
</html>