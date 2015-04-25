package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojo.Books;
import pojo.OrderItem;
import pojo.User;

public class OrderItemDao {
	public List<OrderItem> listOrderItemByOid(int oid){ //按订单id列出该id下的条目
		List<OrderItem> OrderItemlist = new ArrayList<OrderItem>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from orderitem where oid =?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, oid);
			rs=pst.executeQuery();
			while(rs.next()){
				OrderItem o=new OrderItem();
				o.setOiid(rs.getInt(1));
				o.setBid(rs.getInt(2));
				o.setBookname(rs.getString(3));
				o.setPrice(rs.getDouble(4));
				o.setSum(rs.getInt(5));
				o.setOid(rs.getInt(6));
				
				OrderItemlist.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return OrderItemlist;
	}
//	public static void main(String[] args) {
//		OrderItem o=new OrderItem();
//		o.setBid(111);
//		o.setBookname("qqq");
//		o.setPrice(33.3);
//		o.setSum(2);
//		o.setOid(8);
//		addOrderItem(o);
//	}
//	public static void main(String[] args) {
//		List<Integer> l =findOidByBid(10);
//		System.out.println(l.size());
//	}

	public List<Integer> findOidByBid(int bid){ //根据图书id找对应中订单的状态
		List<Integer> statusList = new ArrayList<Integer>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select status from orders where oid in (select oid from orderitem where bid =?)";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, bid);
			rs=pst.executeQuery();
			
			while(rs.next()){
				System.out.println(rs.getInt(1));
				int statusInt=rs.getInt(1);
				statusList.add(statusInt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return statusList;
	}
	
	
	public int addOrderItem(OrderItem o){//添加订单条目
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="insert into orderitem(bid,bookname,price,sum,oid) values (?,?,?,?,?)";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, o.getBid());
			pst.setString(2, o.getBookname());
			pst.setDouble(3, o.getPrice());
			pst.setInt(4, o.getSum());
			pst.setInt(5, o.getOid());
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
