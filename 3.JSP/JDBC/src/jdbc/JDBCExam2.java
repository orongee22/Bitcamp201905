package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class JDBCExam2 {
	
	public static void main(String[] args) {
		
		// 1.EMP 테이블에 새로운 사원 정보를 입력하는 프로그램을 작성해보자.
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","tiger");
			System.out.println("DB 접속 성공!");
									
			SimpleDateFormat datePtn = new SimpleDateFormat("yyyy/mm/dd");			
			String date = datePtn.format(new Date());
						
			String sql = "insert into emp values(?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,8700);
			pstmt.setString(2, "yerina");
			pstmt.setString(3, "DESIGNER");
			pstmt.setString(4, null);
			pstmt.setString(5, date);
			pstmt.setInt(6,2500);
			pstmt.setString(7, null);
			pstmt.setInt(8, 60);
			pstmt.executeUpdate();	
			
			pstmt.close();
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
