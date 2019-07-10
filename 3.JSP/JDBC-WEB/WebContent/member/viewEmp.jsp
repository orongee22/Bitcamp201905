<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String empno = request.getParameter("empno");
	int eno = Integer.parseInt(empno);

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "tiger";
	
	try{
		// 1. 드라이버 로드 : Class.forName()
	
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 2. DB 연결 : Connection
		conn = DriverManager.getConnection(jdbcUrl,user,password);
%>
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
</style>
</head>
<body>
	<h1>EMP LIST</h1>
	<hr>
	
		<%
		// 3. Statement 객체 생성
		stmt = conn.createStatement();
		
		// 사원 리스트를 구하기 위한 select문 작성
		String sql = "select * from emp01 where empno="+eno;
		
		// 4. SQL 실행 : executeQuery / executeUpdate()
		// Select 리스트 결과 가져오기
		rs = stmt.executeQuery(sql);
		
		// 5. 결과 출력  : ResultSet
		
		if(rs.next()){
		%>
			<ul>
				<li>사원번호 : <%=rs.getInt("empno") %></li>
				<li>사원이름 : <%=rs.getString("ename") %></li>
				<li>사원직무 : <%=rs.getString("job") %></li>
				<li>사원급여 : <%=rs.getInt("sal") %></li>
			</ul>
		<%
		}
		
		%>
		<a href="empList.jsp">EmpList로 이동</a>
</body>
</html>
<%
	}
	catch(ClassNotFoundException ce){
		ce.printStackTrace();
	} catch(SQLException se){
		se.printStackTrace();
	}finally{
		// 6. 사용 객체 close
		// null이 아니어야 close / null이면 어차피 예외가 발생하기 때문에 굳이 close하지 않아도 됨.
		// 여기서 try catch를 하는 이유는 close하는 경우에도 예외는 발생할 수 있기 때문임...ㅎ;
		if(rs != null){
			try{
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(stmt != null){
			try{
				stmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(conn != null){
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
%>