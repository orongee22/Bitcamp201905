<%@page import="guestbook.model.Message"%>
<%@page import="guestbook.model.MessageListView"%>
<%@page import="guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNumberstr = request.getParameter("page");

	int pageNumber = 1; // 디폴트 값으로 1 페이지번호는 항상 1페이지부터 시작한다.
	
	if(pageNumberstr != null){
		pageNumber = Integer.parseInt(pageNumberstr);
	}
	
	// 핵심 처리할 서비스 객체
	GetMessageListService service = GetMessageListService.getInstance();
	
	// 응답 데이터의 결과
	MessageListView viewData = service.getMessageListView(pageNumber);

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
	
	div{
		border:2px solid #333;
		margin: 5px 0;
		width: 300px;
	}
</style>
</head>
<body>
	<h3>방명록 글쓰기</h3>
	<hr>
	<form action="writeMessage.jsp" method="post">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="guestName"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		
		<tr>
			<td>메시지</td>
			<td><textarea rows="3" cols="30" name="message"></textarea></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="등록"></td>
		</tr>
		
	</table>
	</form>
	<hr>
	<%
		if(viewData.isEmpty()){
			%>
			<h3>등록된 메시지가 없습니다.</h3>
	<%	
		} else{
			for(Message message : viewData.getMessageList()){
		
	%>
		<div>
			메시지 번호 : <%= message.getId() %><br>
			손님 이름 : <%=message.getGuestName() %><br>
			메시지 : <%=message.getMessage() %><br>
			<!-- 삭제할 때 id값을 파라미터값으로 같이 보냄. 이 아이디로 어떤 메시지를 삭제할 건지 찾을 수가 있음 -->
			<!-- DB에서 만들어 낸 시퀀스 객체가 메시지 아이디가 됨. 시퀀스 객체는 메시지를 만들 떄마다 하나씩 증가하기때문에 지금 현재 메시지는 11번...바뀔수도있음 ㅇㅅㅇ -->
			<a href="confirmDeletion.jsp?messageId=<%=message.getId()%>">삭제하기</a>
		</div>
		<%
			}
		}
	
		// [1][2][3]
		for(int i=1;i<=viewData.getPageTotalCount();i++){
		%>
		
		<a href="list.jsp?page=<%= i%>">[<%=i %>]</a>	
		<%
		}
	%>
</body>
</html>