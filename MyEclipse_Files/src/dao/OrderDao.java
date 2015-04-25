package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pojo.Order;
import pojo.User;


public class OrderDao {

	public List<Order> listOrderByUid(String uid){ //按用户id列出该用户的所有订单（总订单和订单条目，按提交订单时间排序）
		List<Order> Orderlist = new ArrayList<Order>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from orders where uid =? order by otime desc";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			rs=pst.executeQuery();
			while(rs.next()){
				Order o=new Order();
				o.setOid(rs.getInt(1));
				java.util.Date d =rs.getTimestamp(2);
				o.setOtime(d);
				o.setUid(rs.getString(3));
				o.setAllprice(rs.getDouble(4));
				o.setStatus(rs.getInt(5));
				OrderItemDao od=new OrderItemDao();
				o.setOrderitem(od.listOrderItemByOid(rs.getInt(1)));
				Orderlist.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return Orderlist;
	} 
	public List<Order> listAllOrder(){ //列出所有订单（总订单和订单条目，按提交订单时间排序）
		List<Order> Orderlist = new ArrayList<Order>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from orders order by otime desc";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Order o=new Order();
				o.setOid(rs.getInt(1));
				java.util.Date d =rs.getTimestamp(2);
				o.setOtime(d);
				o.setUid(rs.getString(3));
				o.setAllprice(rs.getDouble(4));
				o.setStatus(rs.getInt(5));
				OrderItemDao od=new OrderItemDao();
				o.setOrderitem(od.listOrderItemByOid(rs.getInt(1)));
				Orderlist.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return Orderlist;
	} 
	public List<Order> listOrderByStatus(int status){ //列出某状态下的所有订单（总订单和订单条目，按提交订单时间排序）
		List<Order> Orderlist = new ArrayList<Order>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from orders where status =? order by otime desc";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, status);
			rs=pst.executeQuery();
			while(rs.next()){
				Order o=new Order();
				o.setOid(rs.getInt(1));
				java.util.Date d =rs.getTimestamp(2);
				o.setOtime(d);
				o.setUid(rs.getString(3));
				o.setAllprice(rs.getDouble(4));
				o.setStatus(rs.getInt(5));
				OrderItemDao od=new OrderItemDao();
				o.setOrderitem(od.listOrderItemByOid(rs.getInt(1)));
				Orderlist.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return Orderlist;
	} 
	
	public int findOidByUid(String uid){ //根据用户id查询最新订单的订单号
		int oid=0;
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select oid from orders where uid =? and otime=(select max(otime) from orders)";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			rs=pst.executeQuery();
			if(rs.next()){
				oid=rs.getInt(1);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return oid;
	} 

	public int addOder(String uid,double allprice){//添加总订单
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="insert into orders (otime,uid,allprice) values (Now(),?,?)";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, uid);
			pst.setDouble(2, allprice);
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}
//	public static void main(String[] args) {
//		System.out.println(addOder("a",55.6));
//	}
	
	public int updateCart(int oid,int status){//修改订单状态
		Connection con=null;
		PreparedStatement pst=null;
		int rs=0;
		String sql="update orders set status = ? where oid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, status);
			pst.setInt(2, oid);
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
