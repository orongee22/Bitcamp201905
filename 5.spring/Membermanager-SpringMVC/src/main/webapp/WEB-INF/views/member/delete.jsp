<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	var chk = ${rCnt};
if(chk>0){
	alert('탈퇴가 완료 되었습니다.');
	location.href="<c:url value="/main"/>";
} else {
	alert('탈퇴가 올바르게 되지 않았습니다.');
	location.href="<c:url value="/member/mypage"/>";
}
</script>