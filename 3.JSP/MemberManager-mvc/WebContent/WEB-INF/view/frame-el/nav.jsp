<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
	<ul>
		<%-- 
		el 사용
		<li><a href="${pageContext.request.contextPath}">홈</a></li> 
		<li><a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberRegForm.jsp">회원가입</a></li>
		<li><a href="${pageContext.request.contextPath}/member/myPage.jsp">MY PAGE</a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberReg2.jsp">회원리스트</a></li>
		<li><a href="${pageContext.request.contextPath}/member/logout.jsp">로그아웃</a></li>
		--%>
		
		<!-- jstl 사용 -->
		<li><a href="<c:url value="/" />">홈</a></li> 
		<li><a href="<c:url value="LoginForm" />">로그인</a></li>
		<li><a href="<c:url value="RegForm" />">회원가입</a></li>
		<li><a href="<c:url value="" />">MY PAGE</a></li>
		<li><a href="<c:url value="/member-el/memberList2.jsp" />">회원리스트</a></li>
		<li><a href="<c:url value="/member-el/logout.jsp" />">로그아웃</a></li>
	</ul>
</div>