<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
	*{
		padding: 0;
		margin: 0;
	}
	h1{
		font-size: 24px;
		text-align: center;
	}
	
	
	table{
		width: 500px;
		border: 0;
		border-collapse: collapse;
		margin: 0 auto;
	}
	td{
		border: 1px solid #ddd;
		padding: 10px;
	}
	
	input[type="text"],select{
		height: 25px;
	}
	
	table tr:first-child>td:first-child{
		width: 150px;
	}
	table tr:last-child td{
		text-align: center;
	}
</style>
</head>
<body>
	<div id="wrapper">
	<h1>request 테스트 폼</h1>
	<hr>
	
	<!-- 웬만해선 post방식으로 보내는 것이 좋다. -->
	<!-- action값이 비워져 있다면 default는 해당 페이지로 선택됨. -->
	<form action="../response/request_form_request.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><select name="job">
					<!-- value속성이 없다면 parameterValue값으로 들어오는 값은 자동으로 텍스트로 들어옴. -->
					<option value="none">무직</option>
					<option>학생</option>
					<option>회사원</option>
				</select></td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td>
					<input type="checkbox" value="1" name="interest">정치
					<input type="checkbox" value="2" name="interest">사회
					<input type="checkbox" value="3" name="interest">정보통신
					
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>