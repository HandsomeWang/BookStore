package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.DBUtil;
import pojo.Books;
import pojo.Cart;
import pojo.User;

public class CartDao {
	private BooksDao bd = new BooksDao();
	
//	public static void main(String[] args) {
//		int rs = deleteCart("a",1);
//		System.out.println(rs+"---------------------");
//	}
	
	public int updateCart(String uid,int bid,int sum){//修改购物车中商品数量
		Connection con=null;
		PreparedStatement pst=null;
		int rs=0;
		String sql="update cart set sum = ? where uid=? and bid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, sum);
			pst.setString(2, uid);
			pst.setInt(3, bid);
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
	public int ifExistBook(String uid,int bid){ //用户购物车中是否存在该图书,返回该书的数量
		int key=0;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from cart where uid =? and bid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			pst.setInt(2, bid);
			rs=pst.executeQuery();
			if(rs.next())
			 key=rs.getInt("sum");
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
	
	
	public int addNewBook(String uid,int bid) {//向该用户购物车中添加新的图书(先查询该图书的库存量是否大于等于1)

			int rs=0;
			Connection con=null;
			PreparedStatement pst=null;
			String sql="insert into cart(uid,bid,sum) values (?,?,1)";
			try {
				con=DBUtil.getConnection();
				pst=con.prepareStatement(sql);
				pst.setString(1, uid);
				pst.setInt(2, bid);
				rs=pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			finally{
				DBUtil.close(con, pst, null);
			}
			return rs;
		}
	public List<Cart> listCart(String uid){ //列出该用户的购物车所有图书
		List<Cart> cartlist = new ArrayList<Cart>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from cart where uid =?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			rs=pst.executeQuery();
			while(rs.next()){
				Cart c=new Cart();
				c.setUid(rs.getString("uid"));
				c.setBooks(bd.listBookbyBid(rs.getInt("bid")));
				c.setSum(rs.getInt("sum"));
				cartlist.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return cartlist;
	} 
	
	public int deleteCart(String uid,int bid) {//购物车中删除某图书
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="delete from cart where uid=? and bid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			pst.setInt(2, bid);
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}
	public int deleteAllCart(String uid) {//购物车中删除某用户的全部记录
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="delete from cart where uid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}

}
