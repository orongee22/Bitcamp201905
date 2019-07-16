<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name="";
	String sNum="";
	// 사용자가 입력해둔 파일이름 가져오기.
	String fileName="";
	
	String saveFileName= "";
	long fileSize = 0;
	
	
	String uploadPath = "/upload";
	// context기준 (/web/~~~)으로 하는 절대경로 가져오기
	String dir = request.getSession().getServletContext().getRealPath(uploadPath);

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	// commons-fileupload의 라이브러리 추가.
	// 해당 라이브러리의 내장객체로 처리함.
	// util ㄴㄴ commons ㅇㅇ
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	ServletFileUpload upload =new ServletFileUpload(factory);
	
	// FileItem ?? form 페이지에서 전송한 데이터(이름, 학번, 파일)들을 담아 꺼내쓸 수 있게 list형태로 만든다.
	List<FileItem> items = upload.parseRequest(request);
	
	// iterator에서 제네릭 형식으로 받아오지 않으면 while문 내에서 fileItem으로 다시 한 번 더 형변환 해야함.
	// iterator는 object 객체를 반환하기 때문임.
	Iterator<FileItem> iter = items.iterator();
	while(iter.hasNext()){
		FileItem item = iter.next();
		if(item.isFormField()){
			// type=file 이 아닌 이유
			
			// file이 아니라면 uname이거나 snumber거나...
			// 둘 중 어느 것이 들어올 지 모르기 때문에 if문으로 분기 처리해서
			// uname일지, snumber일 지 물어보는 역할임.
			if(item.getFieldName().equals("uName")){
				name=item.getString("utf-8");
			}
			if(item.getFieldName().equals("sNumber")){
				sNum=item.getString("utf-8");
			}
		} else{
			// type=file인 경우
		
		 	if(item.getFieldName().equals("report"));
			fileName = item.getName();
			fileSize = item.getSize();
			//saveFileName = System.currentTimeMillis()+"_"+fileName;
			// 밀리초보다 더 잘게 쪼갠 시간.
			// 절대 중복이 일어나지 않는다.
			saveFileName = System.nanoTime()+"_"+"_최종_최종_진짜_찐최종_"+fileName;
			item.write(new File(dir, saveFileName));
		}
	}
	
	
	
%>
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
	<h1>
	이름 : <%=name %><br>
	학번 : <%= sNum %><br>
	파일 : <%= saveFileName %><br>
	저장 파일 이름 : <%=saveFileName %><br>
	저장 폴더 : <%= dir %>
	</h1>
	
</html>