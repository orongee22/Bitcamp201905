<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	Cookie[] ck = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
</style>
</head>
<body>
	<h1>로그인</h1>
	<hr>
	<form action="login.jsp" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="text" name="pw"><br>
		아이디 저장<input type="checkbox" id="chk" name="chk"><br>
		<!-- 로그인을 하고난 다음에 아이디를 저장하는 편이 좋은 것 같당 -->
		<!-- 로그인 성공! => 아이디 저장! 아이디를 저장하겠습니까? alert()띄워서 알려주고.....ㅇㅋ? 페이지가 닫아지고 다시 오더라도 출력이 돼야한다..링...ㅎ -->
		<!-- 쿠키 저장은 서버에서 / 로드될 때는 스크립트 value값 받아서 하는 것이 좋겠는데 뭔소리야 ㅠ -->
		<input type="submit" value="로그인">
	</form>	
	<br>
	<a href="loginCheck.jsp">loginCheck</a>
	<script>
		$(document).ready(function(){
			
			$("#chk").on("click", function(){
				var result = confirm("아이디를 저장하시겠습니까?");
				
				if($("#chk").is(":checked") == true){
					if(result){
						// 저장하겠다고 하면? 해당 아이디가 admin인지 확인 후 맞다면 저장 아니면 ㄴㄴ안함
						
					}
				}
				
			});
		});
		
	</script>
</body>
</html>