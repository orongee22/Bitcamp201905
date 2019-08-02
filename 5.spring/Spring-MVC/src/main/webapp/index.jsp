<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Index Page</h1>
<h3>

</h3>
<ul>
	<li><a href="/mvc/home">home</a></li>
	<li><a href="/mvc/hello">hello</a></li>
	<li><a href="<c:url value='/member/login' /> ">/member/login</a></li>
	<li><a href="member/memberLogin">/member/memberLogin</a></li>
	<li><a href="<c:url value='/order/order' /> ">/order/order</a></li>
	<li><a href="<c:url value='/cookie/makeForm' /> ">/cookie/makeForm</a></li>
	<li><a href="<c:url value='/cookie/viewCookie' /> ">/cookie/selectForm</a></li>
	<li><a href="<c:url value='/header/getHeader' /> ">/header/getHeader</a></li>
	<li><a href="<c:url value='/search/search' /> ">/search/search</a></li>
	<li><a href="<c:url value='/fileupload/uploadForm' /> ">/fileUpload/fileUpload</a></li>
</ul>
</body>
</html>