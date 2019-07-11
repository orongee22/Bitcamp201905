<%@page import="guestbook.service.WriteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. form 에서 데이터 받아옴
	// 2. Message 객체에 저장 : useBean 사용
	// 3. WriteMessageService 객체 생성
	// 4. WriteMessageService.write 메소드를 실행함 - 결과값은 숫자. 1 or 0 (실행이 됐는지 안됐는 지 확인용)
	
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="guestbook.model.Message"/>
<jsp:setProperty property="*" name="message" />
<%
	WriteMessageService service = WriteMessageService.getInstance();
	int cnt = service.write(message);
%> 
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
	<h1>
		<%= cnt > 0? "방명록에 메시지를 남겼습니다." : "메시지 등록에 실패했습니다."%>
	</h1>
	<a href="list.jsp">목록으로 돌아가기</a>
</body>
</html>