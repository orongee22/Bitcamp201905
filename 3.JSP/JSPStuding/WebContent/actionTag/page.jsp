<%@ page import="member.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

	// page.jsp의 name="type"값을 매개변수로 받아 요청을 처리할 수 있음.
	// 리퀘스트의 매개변수를 받을 때는 문자열로만 받을 수 있음.
	// page.jsp에 처음 접근한다면 매개변수로 받은 값이 전혀 없음!
	// 값이 없다면 null값을 가지고 nullPointException 오류로 인해 접근 불가할 수 있음.
	// 널포인트웅앵 에러가 나는 경우는 주로 오타... 혹은 값이 없을 떄 자주 생김 ㅠ
	String pType = request.getParameter("type");
	String no = request.getParameter("no");
	String uname = request.getParameter("uname");
	
	Member member = new Member(uname, pType, no);
	
	// null일 경우는 강제 디폴트 값으로 a value값을 넣어서 오류를 없애자.
	if(pType == null){
		pType = "a";
	}
	
	if(no == null){
		no = "0";
	}
	
	if(uname == null){
		uname = "noname";
	}
	
	if(pType.equals("a")){
%>		
	<jsp:forward page="page_a.jsp">
	</jsp:forward>
<% } else if(pType.equals("b")){ %>
	<jsp:forward page="page_b.jsp">
	</jsp:forward>
<% } else {%>
	<jsp:forward page="page_c.jsp">
	</jsp:forward>
<% } %>	

