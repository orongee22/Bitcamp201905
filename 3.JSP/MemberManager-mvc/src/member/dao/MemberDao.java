package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.model.LoginInfo;
import member.model.MemberInfo;

public class MemberDao {
	private static MemberDao dao = new MemberDao();
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	public int insert(Connection conn, MemberInfo mInfo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "insert into memberinfo values(gm_mid_seq.nextval,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mInfo.getuId());
			pstmt.setString(2, mInfo.getuPw());
			pstmt.setString(3, mInfo.getuName());
			pstmt.setString(4, mInfo.getuPhoto());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	
	public LoginInfo login(Connection conn, String uId, String uPw) {
		LoginInfo loginInfo = null;
		ResultSet rs = null;
		
		PreparedStatement pstmt = null;
		String sql = "select * from memberinfo where u_id =? and u_pw=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			pstmt.setString(2, uPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginInfo.setuId(rs.getString(2));
				loginInfo.setuName(rs.getString(4));
				loginInfo.setuPhoto(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return loginInfo;
	}
}
