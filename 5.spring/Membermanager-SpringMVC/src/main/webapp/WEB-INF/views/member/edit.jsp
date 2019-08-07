<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var chk = ${rCnt};
	if(chk>0){
		alert('수정되었습니다.');
		location.href="<c:url value="/member/mypage"/>";
	} else {
		alert('수정이 되지 않았습니다.');
		location.href="<c:url value="/member/mypage"/>";
	}
</script>