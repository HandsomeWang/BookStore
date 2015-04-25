package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;
import pojo.Msg;

public class MsgDao {
	private UserDao ud = new UserDao();

	public List<Msg> listAllMag(){ //列出所有留言，按时间降序排列
		List<Msg> msglist = new ArrayList<Msg>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from msg order by date desc";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Msg m=new Msg();
				m.setMid(rs.getInt(1));
				m.setUid(rs.getString(2));
				String name = ud.findNameByUid(rs.getString(2));
				m.setName(name);
				m.setTheme(rs.getString(3));
//				m.setEmail(rs.getString(4));
				m.setContext(rs.getString(4));
				java.util.Date d =rs.getTimestamp(5);
				m.setDate(d);
				msglist.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return msglist;
	} 
	public int addNewMsg(Msg msg) {//添加新的留言
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="insert into msg(uid,theme,context,date) values (?,?,?,Now())";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1,msg.getUid() );
		//	pst.setString(2,msg.getName() );
			pst.setString(2, msg.getTheme());
//			pst.setString(3, msg.getEmail());
			pst.setString(3,msg.getContext() );
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}
	public int deleteMsg(int mid){//删除留言
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="delete from msg where mid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, mid);
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
