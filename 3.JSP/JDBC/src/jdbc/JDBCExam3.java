package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCExam3 {
	
	public static void main(String[] args) {
		
		// 2.EMP 테이블의 모든 데이터를 출력하는 프로그램을 작성해보자.
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","tiger");
			System.out.println("DB 접속 성공!");
									
			Statement stmt = conn.createStatement();
			
			String sqlSelect = "select * from emp";
			
			ResultSet rs = stmt.executeQuery(sqlSelect);
			
			while(rs.next()) {
				System.out.println("사원번호"+rs.getInt(1));
				System.out.println("직업"+rs.getString(2));
				System.out.println("이름"+rs.getString(3));
				System.out.println("관리자"+rs.getInt(4));
				System.out.println("날짜"+rs.getString(5));
				System.out.println("급여"+rs.getInt(6));
				System.out.println("커미션"+rs.getInt(7));
				System.out.println("부서번호"+rs.getInt(8));
				System.out.println("==================");
			}

			stmt.close();
			rs.close();
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
