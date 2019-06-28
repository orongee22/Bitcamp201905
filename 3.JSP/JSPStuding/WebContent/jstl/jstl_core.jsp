    
<%@page import="java.util.ArrayList"%>
<%@page import="member.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	List<Member> list = new ArrayList<Member>();

	list.add(new Member("guuguu","구구","010-9999-9999"));
	list.add(new Member("guuguu1","구구1",null));
	list.add(new Member("guuguu2","구구2","010-9999-9999"));
	list.add(new Member("guuguu3","구구3","010-9999-9999"));
	list.add(new Member("guuguu4","구구4","010-9999-9999"));
	list.add(new Member("guuguu5","구구5","010-9999-9999"));
	list.add(new Member("guuguu6","구구6","010-9999-9999"));
	list.add(new Member("guuguu7","구구7","010-9999-9999"));
	list.add(new Member("guuguu8","구구8","010-9999-9999"));
	
	application.setAttribute("members", "list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
span.nopnum {
		color : red;
	}
</style>
</head>
<body>

	<c:url value="/member/list.jsp" var="uri_mList">
		<c:param name="pno">5</c:param>
	</c:url>
	
	<h3>단순 출력 : ${uri_mList}</h3>
	<h3>링크 연동 1: <a href="${uri_mList}">회원 리스트</a></h3>
	<h3>링크 연동2:<a href="<c:uri value='/member/list.jsp'">회원리스트2</a></h3>
	
	
	<c:set value="test" var="msg" />
	msg : ${msg} <br>
	
	<c:if test="${msg eq 'test'}">
		
		msg의 문자열은 test와 같습니다.
		
	</c:if>
	
	<c:if test="${msg eq 'test'}" var="condition" />
	
	<br>
	결과값은 : ${condition}


	<hr>

	<h3>
		${param.code} <br>
		<c:out value="${param.code}" escapeXml="false">
			<span style="color: red">b</span>
		</c:out>
	</h3>
	<hr>	
	<table>
		<tr>
			<td>index/count</td>
			<td>이름</td>
			<td>아이디</td>
			<td>전화번호</td>
		</tr>
		
		<c:forEach items="${members}" var="member" varStatus="status" begin="0" end="5">
		<tr>
			<td>${status.index} / ${status.count} </td>
			<td>${member.name}</td>
			<td>${member.id}</td>
			<td>
				
				<c:out value="${member.pNum}" escapeXml="false">
					<span class="nopnum">전화번호 없음</span>
				</c:out>
				
			</td>
		</tr>
		</c:forEach>
		
		<c:forTokens items="홍길동,010-8888-6666,서울" delims="," var="sel">
			${sel} <br>			
		</c:forTokens>
	</table>

</body>
</html>