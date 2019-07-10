<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	
	int eno = Integer.parseInt(empno);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;
	
	try{
	// 1. DB 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	
	// 2. DB 연결
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","tiger");
	
	// 3. PreparedStatement 생성
	String sql = "update emp01 set ename=? where empno=?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ename);
	pstmt.setInt(2, eno);
	
	// 4. SQL 실행 : executeUpdate()
	resultCnt = pstmt.executeUpdate();
	// 5. 실행결과 출력 : 수정 되었습니다.
	} catch(ClassNotFoundException ce){
		ce.printStackTrace();
	} catch (SQLException se){
		se.printStackTrace();
	} finally{
		pstmt.close();
		conn.close();
	}
	
	
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
	<h1>사원정보 수정</h1>
	<h3> <%=resultCnt %>개 행이 수정 되었습니다.</h3>
</body>
</html>