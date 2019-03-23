package wsl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import wsl.vo.LoginVO;

public class WslDAO {
	
	private static WslDAO w_dao;
	
	private WslDAO() {
	}
	
	public static WslDAO getInstance() {
		if (w_dao == null) {
			w_dao = new WslDAO();
		}
		
		return w_dao;
	}
	
	public Connection getConn() throws SQLException {
		Connection con = null;
		
		// DBCP로부터 Connection 얻음
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/webSimpleLogin");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public boolean login(LoginVO lvo) throws SQLException {
		boolean flag = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		try {
			con = getConn();
			
			String selectUser = "SELECT id FROM simple_login_user WHERE id=? AND password=? ";
			
			pstmt = con.prepareStatement(selectUser);
			pstmt.setString(1, lvo.getId());
			pstmt.setString(2, lvo.getPassword());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				flag = true;
			}
			
		} finally {
			if (rs != null) { rs.close(); }
			if (pstmt != null) { pstmt.close(); }
			if (con != null) { con.close(); }
		}
		
		return flag;
	}

}
