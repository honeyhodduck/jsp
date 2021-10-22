package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement preSt;
	private ResultSet rs;
	
	public UserDAO() {
		try{		
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId = "root";
			String dbPassword ="1234";
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbURL,dbId,dbPassword);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String _userId, String _userPassword  ) {
		String sql = "SELECT userPassword from user where userId = ?";
		
		try {
			preSt = conn.prepareStatement(sql);
			preSt.setString(1, _userId);
			rs = preSt.executeQuery();
			if(rs.next())
			{
				if(rs.getString(1).equals(_userPassword))
				{
					return 1; //로그인 성공
				}
				else
					return 0; // 비밀번호 불일치 
			}
			return -1; // 아이디 없음
			
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	
}
