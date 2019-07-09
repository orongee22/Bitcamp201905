package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCExam4 {
	
	public static void main(String[] args) {
		
		// 3. EMP 테이블에 서 “SCOTT” 사원의 급여(sal) 정보를 1000으로 바꾸는 프로그램을 작성해보자.
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","tiger");
			System.out.println("DB 접속 성공!");
									
			Statement stmt = conn.createStatement();
			String sqlUpdate = "update emp set sal=1000 where ename='SCOTT'";
			int result = stmt.executeUpdate(sqlUpdate);
			
			if(result!=0) {				
				System.out.println(result+ "개 행이 업데이트 되었습니다.");
			}


			stmt.close();
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
