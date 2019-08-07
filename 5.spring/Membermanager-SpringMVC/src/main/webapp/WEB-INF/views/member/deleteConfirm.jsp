<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var chk = confirm("정말로 탈퇴하시겠습니까?");
	if(chk){
		location.href="<c:url value="/member/delete?uId=${loginInfo.uId}"/>";
	} else {
		alert('탈퇴를 취소했습니다.');
		location.href="<c:url value="/member/mypage"/>";
	}
</script>