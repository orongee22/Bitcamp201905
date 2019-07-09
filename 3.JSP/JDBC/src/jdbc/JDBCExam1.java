package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCExam1 {
	
	public static void main(String[] args) {		
		Connection conn = null;
		try {
			// 1. 데이터베이스 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 데이터베이스 연결
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","tiger");
			System.out.println("오라클 데이터베이스에 접속했습니다.");
			
			// 3. Statement 객체 생성
			Statement stmt = conn.createStatement();
			
			// insert 구문 - preparedstatement 객체에 넣을 예시구문임.
			String sqlInsert ="insert into dept values(?,?,?)";

			PreparedStatement pstmt = conn.prepareStatement(sqlInsert);
			
			pstmt.setInt(1, 60);
			pstmt.setString(2,"DESIGN");
			pstmt.setString(3,"SEOUL");
			int resultCnt = pstmt.executeUpdate();
			if(resultCnt>0) {
				System.out.println("정상적으로 추가되었습니다.");
				System.out.println("==========================");
			}
			
			
			// 4. SQL문 실행 : SELECT / DML(INSERT,UPDATE,DELETE)
			String sql1 = "select * from dept order by deptno";
			
			// 5. 결과 출력
			ResultSet rs = stmt.executeQuery(sql1);
			
			System.out.println("===============================");
			
			while(rs.next()) {
				System.out.println("부서번호"+rs.getInt("deptno"));
				System.out.println("부서이름"+rs.getString("dname"));
				System.out.println("부서위치"+rs.getString(3));
				System.out.println("===============================");
			}
			
			// 6. 연결 종료 : ResultSet, Statement, Connection 클로즈
			rs.close();
			pstmt.close();
			stmt.close();
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
