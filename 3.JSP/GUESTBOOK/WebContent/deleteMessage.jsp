<%@page import="guestbook.service.InvalidMessagePasswordException"%>
<%@page import="guestbook.service.MessageNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="guestbook.service.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	
	int resultCnt = 0;
	// 정상적으로 처리되었는 지 아닌지 체크하는 용도임.
	boolean chk = false;
	String msg ="";
	// 서비스 객체 생성
	DeleteMessageService service = DeleteMessageService.getInstance();
	
	try{
		
		resultCnt = service.deleteMessage(messageId, password);
		// 예외 발생 시 각각 다른 메시지를 띄우기 위해 따로 예외 처리를 하는 것임....
		chk= true;
	} catch(SQLException e){
		msg = e.getMessage();
		chk=false;
	} catch (MessageNotFoundException e){
		msg = e.getMessage();
		chk=false;
	} catch(InvalidMessagePasswordException e) {
		msg = e.getMessage();
		chk=false;
	}
%>
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
</style>
</head>
<body>
	<h1>
		<% if(chk){ %>
			<%= resultCnt %> 개의 행이 삭제되었습니다.
		<% } else { %>
			<%=msg %>
		<% } %>
	</h1>
	
	<a href="list.jsp">리스트</a>
</body>
</html>