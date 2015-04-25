package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pojo.Note;

public class NoteDao {
	public List<Note> listAllNote(){ //列出所有公告，按时间降序排列
		List<Note> msglist = new ArrayList<Note>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from note order by ndate desc";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Note m=new Note();
				m.setNid(rs.getInt(1));
				m.setAid(rs.getString(2));
				m.setNcontent(rs.getString(3));
				java.util.Date d =rs.getTimestamp(4);
				m.setNdate(d);
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
	public Note listLastNote(){ //查找最新公告
		Note m=new Note();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from note where ndate=(select max(ndate) from note)";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			if(rs.next()){
				
				m.setNid(rs.getInt(1));
				m.setAid(rs.getString(2));
				m.setNcontent(rs.getString(3));
				java.util.Date d =rs.getTimestamp(4);
				m.setNdate(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return m;
	} 
	public int addNewNote(Note msg) {//添加新的公告
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="insert into note(aid,ncontent,ndate) values (?,?,Now())";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1,msg.getAid() );
			pst.setString(2, msg.getNcontent());
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}
	public int deleteNote(int nid){//删除公告
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="delete from note where nid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, nid);
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
