package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pojo.Admin;

public class AdminDao {
	public int checkIfLogin(Admin ad){
		//根据传入的用户名、密码判断是否登录成功
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		String sql="select aid,apwd from admin where aid=? and apwd=?";
		int key = 0;		
			try {
				con=DBUtil.getConnection();
				stmt = con.prepareStatement(sql);
				stmt.setString(1, ad.getAid());
				stmt.setString(2, ad.getApwd());
				rs = stmt.executeQuery();	
				if (rs.next()) {
						key= 1;//匹配成功
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				DBUtil.close(con,stmt,rs);
			}	
			return key;
	}
}
