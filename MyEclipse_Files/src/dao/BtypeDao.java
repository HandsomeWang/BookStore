package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojo.Books;
import pojo.Btype;
import pojo.User;

public class BtypeDao {
	public Btype findTypebytTd(int tid){ //根据tid查找类型
		Btype b = new Btype();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from btype where tid =?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, tid);
			rs=pst.executeQuery();
			if(rs.next()){
				b.setTid(rs.getInt(1));
				b.setTname(rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return b;
		}
	public List<Btype> listAllType(){ //列出所有类型
		List<Btype> typeslist = new ArrayList<Btype>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from btype";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Btype b=new Btype();
				b.setTid(rs.getInt(1));
				b.setTname(rs.getString(2));
				
				typeslist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return typeslist;
	} 
	public int addType(String tname){//添加新类型
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="insert into btype(tname) values (?)";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, tname);
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}
	public int deleteType(int tid){//删除类型
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="delete from btype where tid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, tid);
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}
	public int updatetype(int tid,String tname){//根据类型id更新某类型名
		Connection con=null;
		PreparedStatement pst=null;
		int rs=0;
		String sql="update btype set tname =? where tid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, tname);
			pst.setInt(2, tid);
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
