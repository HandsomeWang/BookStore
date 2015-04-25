package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dao.DBUtil;
import pojo.Books;
import pojo.User;

public class UserDao {
	public int addUser(User u){//添加新用户
		//User user = new User();
		int rs=0;

		Connection con=null;
		PreparedStatement pst=null;
		String sql="insert into user values (?,?,?,?,?,?,?,?,?)";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, u.getUid());
			pst.setString(2, u.getName());
			pst.setString(3, u.getPassword());
			pst.setString(4, u.getIdcard());
			pst.setString(5, u.getEmail());
			pst.setString(6, u.getEdu());
			pst.setString(7, u.getTel());
			pst.setString(8, u.getPost());
			pst.setString(9, u.getAddr());

			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}
	
	public int ifExistUser(String uid){//根据uid判断是否存在该用户
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int key=0;
		String sql="select * from user where uid=?";

		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			rs=pst.executeQuery();
			if(rs.next()){
				key=1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return key;
	}
	
//	public static void main(String[] args) {
//		System.out.println(findNameByUid("a"));
//	}
	public String findNameByUid(String uid){//根据uid找到用户名
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String username=null;
		String sql="select name from user where uid=?";
		
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			rs=pst.executeQuery();
			if(rs.next()){
				username=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return username;
	}
	public User findUserByUid(String uid){//根据uid找到用户信息
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		User u = new User();
		String sql="select * from user where uid=?";
		
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			rs=pst.executeQuery();
			if(rs.next()){
				u.setUid(rs.getString(1));
				u.setName(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setIdcard(rs.getString(4));
				u.setEmail(rs.getString(5));
				u.setEdu(rs.getString(6));
				u.setTel(rs.getString(7));
				u.setPost(rs.getString(8));
				u.setAddr(rs.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return u;
	}
	
	public int checkIfLogin(User u){
		//根据传入的用户名、密码判断是否登录成功
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		String sql="select uid,password from user where uid=? and password=?";
		int key = 0;		
			try {
				con=DBUtil.getConnection();
				stmt = con.prepareStatement(sql);
				stmt.setString(1, u.getUid());
				stmt.setString(2, u.getPassword());
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
	public int updateUser(User u){//修改用户信息(除了密码之外的信息)
		Connection con=null;
		PreparedStatement pst=null;
		int rs=0;
		String sql="update user set name = ? , idcard=? , email=? , edu=? ,tel=? , post=? ,addr=?  where uid=? ";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			
			pst.setString(1, u.getName());
			pst.setString(2, u.getIdcard());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getEdu());
			pst.setString(5, u.getTel());
			pst.setString(6, u.getPost());
			pst.setString(7, u.getAddr());
			pst.setString(8, u.getUid());
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst,null);
		}
		return rs;
	}
	public int updatePwd(String pwd,String uid){//修改用户密码
		Connection con=null;
		PreparedStatement pst=null;
		int rs=0;
		String sql="update user set password = ? where uid=? ";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			
			pst.setString(1, pwd);
			pst.setString(2, uid);
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst,null);
		}
		return rs;
	}

}
