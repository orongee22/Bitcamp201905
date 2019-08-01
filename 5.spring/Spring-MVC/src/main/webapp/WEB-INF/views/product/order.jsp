<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		padding: 10px;
		margin: 4px;
		width: 25px;
		border: 1px solid #bbb;
	}
</style>
</head>
<body>
<h1>주문 내역</h1>
<c:forEach items="${orders.orderItems}" var="item">
	<div>
		상품 id : ${item.itemId}<br>
		상품 갯수 : ${item.number }<br>
		상품 주의사항 : ${item.remark }
	</div>
</c:forEach>
<h1>배송지</h1>
<div>
	우편번호 : ${orders.address.zipcode}<br>
	주소 1 :${orders.address.address1}<br>
	주소2 : ${orders.address.address2}
</div>
</body>
</html>