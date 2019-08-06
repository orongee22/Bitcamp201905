<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
<style>
	input[checkbox]{
		display: none
	}
	.color_red{
		color: red;
	}
	.color_green{
		color: green;
	}
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>회원가입 페이지</h3>
	<hr>
	<!-- 파일 업로드 할때 post방식은 필수. 파일을 넘겨주기 위해선 현재 타입이 multipart여야만 가능하다. 이 형식으로 들어오지 않으면 안됨. -->
	<form id="regform" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td>
				<!-- 사용자가 id를 쓸 수 있는지 없는 지 중복 여부 체크할 때 쓰는 체크박스 -->
				<input type="checkbox" id="idCheck">
				<input type="email" id="uId" name="uId" required> <span id="idcheckmsg"></span></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPW" required> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName" required> </td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="uPhoto"> </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="회원가입"> </td>
			</tr>
		</table>
	</form>
</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->


<script>

	$(document).ready(function(){
		// input에 포커스 아웃이 되면 아이디 중복여부가 span에 뜰거임
		// 다시 포커스 인이 된다면 체크값이 풀리고 포커스 아웃되면 새로운 아이디 중복여부가 떠야함...ㅇㅋ?
		$('#uId').focusout(function(){
			$.ajax({
				url : 'idCheck.do',
				// 메소드 방식은 get이든 post든 상관,,,X
				type : 'get',
				// idcheck.do 파일에 get방식으로 id라는 이름의 this.val()을 data로 보냄. 만약 통신이 성공한다면 보낸 데이터를 매개변수로 다시 불러들여온다.
				data: {id: $(this).val()},
				success: function(data){
					alert(data);
					$('#idcheckmsg').html('');
					$('#idcheckmsg').removeClass('color_red');
					$('#idcheckmsg').removeClass('color_green');
					if(data == 'Y'){
						$('#idCheck').prop('checked',true);
						$('#idcheckmsg').html('사용가능한 멋진 아이디입니다.');
						$('#idcheckmsg').addClass('color_green');
					} else {
						$('#idCheck').prop('checked',false);
						$('#idcheckmsg').html('사용중인 아이디 이거나 탈퇴한 회원의 아이디 입니다.');
						$('#idcheckmsg').addClass('color_red');
					}
				}
				
			});
			
			
		});
		
		$('#regform').submit(function(){
			// check가 안되어있다면 중복이거나, 확인을 안하거나 둘 중 하나임
			if(!$('#idCheck').prop('checked')){
				alert('아이디 중복확인이 필요합니다.');
				return false;
			} else {
				alert('회원가입 성공!');
			}
		});
		
	});
</script>






</body>
</html>