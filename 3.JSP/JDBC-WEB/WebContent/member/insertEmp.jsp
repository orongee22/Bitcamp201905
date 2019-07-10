<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="member.Emp"/>
<jsp:setProperty property="*" name="member" />
 
<%	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;
	
	try{
	// 1. DB 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	
	// 2. DB 연결
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","tiger");
	
	// 3. PreparedStatement 생성
	String sql = "insert into emp01 (empno,ename,job) values(?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, member.getEmpno());
	pstmt.setString(2, member.getEname());
	pstmt.setString(3, member.getJob());
	
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
	<h3>새로운 사원 <%=resultCnt %>명의 정보가 추가되었습니다.</h3>
	<a href="empList.jsp">empList로 이동</a>        
</body>
</html>