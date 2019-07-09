package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnection2 {
	public static void main(String[] args) {
		
		// 1. 데이터베이스의 드라이버를 로드한다.
		// 2. 데이터베이스에 연결.
		
		Connection conn = null;
		// JDBC_URL : Oracle
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521/orcl";
		// USER
		String user = "scott";
		// Password
		String pw = "tiger";
		
		try {
			// 1. 드라이버 로드 :
			// 1-1. Oracle 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 데이터베이스 연결
			conn = DriverManager.getConnection(jdbcUrl,user,pw);
			System.out.println("데이터베이스 연결 성공.");
			
			// 3. 데이터베이스의 연결 종료 : 데이터베이스 작업 종료 후 연결 종료해야 함
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 1-2. oracle 로드
	}
}
