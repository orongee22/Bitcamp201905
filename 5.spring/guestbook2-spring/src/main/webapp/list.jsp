<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	div {
		border : 2px solid #666;
		width : 200px;
	}
</style>
</head>
<body>
	<h1>방명록</h1>
	<div style=""><a href="writeForm">글쓰기</a></div>
	<div id="list">
		
	</div>
	
	<div id="paging">
	
	</div>
	
	
	<script>
		
		$(document).ready(function(){
			page(1);
		});
			
			function page(num){
				$.ajax({
					url: 'guest/listJson',
					type : 'get',
					data : {page:num},
					success : function(data){
						console.log(data);
						console.log(data.messageTotalCount);
						console.log(JSON.stringify(data));
						var output = "";
						var list = data.messageList;
						for(var i = 0;i<list.length;i++){
							console.log();
							var id = list[i].id;
							var guestName = list[i].guestName;
							var message = list[i].message;
							output += '<div>\n';
							output += '메시지 번호 : '+id+' <br>\n';
							output += '손님 이름 : '+guestName+' <br>\n';
							output += '메시지 : '+message+'\n';
							output += '</div>\n';
						}
						
						var paging = '';
						for(var j=1;j<=data.pageTotalCount;j++){
							paging += '<span class="paging"><a href="#" onclick="page('+j+')">'+ j +'</a></span>';
						}
						$('#list').html(output);
						$('#paging').html(paging);
					}
				});
			}
	</script>

</body>
</html>