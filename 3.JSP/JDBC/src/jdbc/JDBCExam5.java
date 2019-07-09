package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCExam5 {
	
	public static void main(String[] args) {
		
		// 4.EMP 테이블에 서 “SCOTT” 이름으로 검색한 결과를 출력하는 프로그램을 작성해보자.
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","tiger");
			System.out.println("DB 접속 성공!");
									
			String sql = "select * from emp where ename='SCOTT'";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				System.out.println("====================");
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

			
			rs.close();
			pstmt.close();
			conn.close();

			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
