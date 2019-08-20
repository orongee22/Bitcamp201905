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
		<li>
			<c:if test="${loginInfo eq null }">
				<a href="<c:url value="/member/login" />">로그인</a>
			</c:if>
			<c:if test="${loginInfo ne null }">
				<a href="<c:url value="/member/logout" />">로그아웃</a>
			</c:if>
		</li>
		<li><a href="<c:url value="/member/regist" />">회원가입</a></li>
		<li><a href="<c:url value="/member/mypage/mypage" />">MY PAGE</a></li>
		<li><a href="<c:url value="/member/memberList" />">회원리스트</a></li>
		<li><a href="<c:url value="/member/json/memberListJson" />">회원리스트 JSON</a></li>
		<li><a href="<c:url value="/member/json/memberListJson2" />">회원리스트 JSON2</a></li>
		<li><a href="<c:url value="/rest-api/members/" />">회원리스트 REST-API</a></li>
	</ul>
</div>