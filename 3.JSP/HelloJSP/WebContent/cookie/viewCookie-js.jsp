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
</style>
</head>
<body>

쿠키 이름 <input type="text" id="cName">, 쿠키 데이터 <input type="text" id="cValue">
<input type="button" id="createCookie" value="쿠키 생성!">
<input type="button" id="deleteCookie" value="쿠키 삭제!">
<hr>
<input type="button" id="viewCookie" value="쿠키값 확인하기기기">
<div id="view">

</div>

<script>
	$(document).ready(function(){
		
		var name = 'name';
		
		$('#createCookie').click(function(){
			var cName = $('#cName').val();
			var cValue = $('#cValue').val();
			setCookie(cName,cValue,1);
		});
		
		$('#viewCookie').click(function(){
			name = $('#cName').val();
			// value값이 배열로 들러오는데 그 중에 3번째 웅앵이 값이라 그거 찾아오는 정규식임 ㅠ 항상 고정값임~!
			var value = document.cookie.match('(^|;) ?'+name+'=([^;]*)(;|$)');
			
			console.log(value);
			//["; name=예리나;", ";", "예리나", ";", index: 6, input: "code=0; name=예리나; ㅇ=ㅇ; ㅇㅇ=undefined; undefined; `12=444; dd=dd; name=data", groups: undefined]
			value = value ? value[2] : null;
			
			alert(value);
			$('#view').html(name+'='+value);
		});
		
		$('#deleteCookie').click(function(){
			var cName = $('#cName').val();
			deleteCookie(cName);
		});
		
		
		var setCookie = function(name, value, day){
			var date = new Date();
			date.setTime(date.getTime()+day*60*60*24*1000);
			document.cookie= name + '=' + value	+ ';expires=' + date.toUTCString()
			+ ';path=/';
		};
		
		var	deleteCookie = function(name, value, day){
			var date = new Date();
			date.setTime(date.getTime()+day*60*60*24*1000);
			document.cookie= name + '=' + value	+ ';expires=' + date.toUTCString()
			+ ';path=/';
		};
	});
</script>
</body>
</html>