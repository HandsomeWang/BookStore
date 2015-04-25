package dao;
import java.sql.*; 
import java.util.ArrayList;
import java.util.List;
import pojo.Books;
import pojo.User;
import service.PageConstants;


public class BooksDao {

	public int allBooks(){//查询所有图书数量
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int count=0;
		String sql="select * from books";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return count;
	}
	
	public List<Books> listHotBooks(int pc){ //热点图书，即按销售量排序
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		List<Books> bookslist = new ArrayList<Books>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from books order by count desc limit ?,?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, (pc-1) * ps);//当前页首行记录的下标
			pst.setInt(2, ps);//一共查询几行，就是每页记录数
			rs=pst.executeQuery();
			while(rs.next()){
				Books b=new Books();
				b.setBid(rs.getInt(1));
				b.setBookname(rs.getString(2));
			//	System.out.println(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPress(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBrief(rs.getString(6));
				b.setType(rs.getInt(7));
				b.setInventory(rs.getInt(8));
				b.setCount(rs.getInt(9));
				b.setBdate(new java.util.Date(rs.getDate(10).getTime()));
				b.setRecommend(rs.getInt(11));
				b.setPic(rs.getString(12));
				bookslist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return bookslist;
	} 
	
	public List<Books> listNewBooks(int pc){ //新书，即按添加图书的时间排序
		List<Books> bookslist = new ArrayList<Books>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		String sql="select * from books order by bdate desc limit ?,?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, (pc-1) * ps);//当前页首行记录的下标
			pst.setInt(2, ps);//一共查询几行，就是每页记录数
			rs=pst.executeQuery();
			while(rs.next()){
				Books b=new Books();
				b.setBid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPress(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBrief(rs.getString(6));
				b.setType(rs.getInt(7));
				b.setInventory(rs.getInt(8));
				b.setCount(rs.getInt(9));
				b.setBdate(new java.util.Date(rs.getDate(10).getTime()));
				b.setRecommend(rs.getInt(11));
				b.setPic(rs.getString(12));
				bookslist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return bookslist;
	} 
	public List<Books> listrecommend(int pc){ //查找所有推荐的图书
		List<Books> bookslist = new ArrayList<Books>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		String sql="select * from books where recommend=1 order by bdate desc limit ?,?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, (pc-1) * ps);//当前页首行记录的下标
			pst.setInt(2, ps);//一共查询几行，就是每页记录数
			rs=pst.executeQuery();
			while(rs.next()){
				Books b=new Books();
				b.setBid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPress(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBrief(rs.getString(6));
				b.setType(rs.getInt(7));
				b.setInventory(rs.getInt(8));
				b.setCount(rs.getInt(9));
				b.setBdate(new java.util.Date(rs.getDate(10).getTime()));
				b.setRecommend(rs.getInt(11));
				b.setPic(rs.getString(12));
				bookslist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return bookslist;
	} 
	
	public int allRecommend(){ //查询推荐图书的总数

		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int count=0;
		String sql="select * from books where recommend=1";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return count;
	} 
	
	public int listSpecialBooksCount(String field,int type,String condition){ //按检索条件查询图书总数

		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
		int count = 0;
		
		if(type!=0&&!field.equals("检索方式"))
			sql="select * from books where type="+type+" and "+field+" like '%"+condition+"%'";
		else if(type==0&&!field.equals("检索方式"))
			sql="select * from books where "+field+" like '%"+condition+"%'";
		else if(type!=0&&field.equals("检索方式"))
			sql="select * from books where type="+type+" and (bookname like '%"+condition+"%' or author like '%"+condition+"%' or press like '%"+condition+"%' )";
		else if(type==0&&field.equals("检索方式"))
			sql="select * from books where bookname like '%"+condition+"%' or author like '%"+condition+"%' or press like '%"+condition+"%' ";
		
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);	
			rs=pst.executeQuery();
			while(rs.next()){
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return count;
	}
	
//	public static void main(String[] args) {
//		System.out.println(listSpecialBooksCount("bookname",0,"a"));
//	}
	public List<Books> listSpecialBooks(String field,int type,String condition,int pc){ //按检索条件查询图书
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		List<Books> bookslist = new ArrayList<Books>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql=null;
				
		if(type!=0&&!field.equals("检索方式"))
			sql="select * from books where type="+type+" and "+field+" like '%"+condition+"%' limit "+(pc-1) * ps +","+ps;
		else if(type==0&&!field.equals("检索方式"))
			sql="select * from books where "+field+" like '%"+condition+"%' limit "+(pc-1) * ps +","+ps;
		else if(type!=0&&field.equals("检索方式"))
			sql="select * from books where type="+type+" and (bookname like '%"+condition+"%' or author like '%"+condition+"%' or press like '%"+condition+"%' ) limit "+(pc-1) * ps +","+ps;
		else if(type==0&&field.equals("检索方式"))
			sql="select * from books where bookname like '%"+condition+"%' or author like '%"+condition+"%' or press like '%"+condition+"%' limit "+(pc-1) * ps +","+ps;
		
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);	
			rs=pst.executeQuery();
			while(rs.next()){
				Books b=new Books();
				b.setBid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPress(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBrief(rs.getString(6));
				b.setType(rs.getInt(7));
				b.setInventory(rs.getInt(8));
				b.setCount(rs.getInt(9));
				b.setBdate(new java.util.Date(rs.getDate(10).getTime()));
				b.setRecommend(rs.getInt(11));
				b.setPic(rs.getString(12));
				bookslist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return bookslist;
	} 
	
	public int listTypeBooksCount(int type){ //按分类查找图书的总数

		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int count=0;
		String sql="select * from books where type =?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, type);
			rs=pst.executeQuery();
			while(rs.next()){
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return count;
	} 
	public List<Books> listTypeBooks(int type,int pc){ //按分类查找图书
	//	System.out.println("type string is---"+type);
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		List<Books> bookslist = new ArrayList<Books>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from books where type =? limit ?,?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, type);
			pst.setInt(2, (pc-1) * ps);//当前页首行记录的下标
			pst.setInt(3, ps);//一共查询几行，就是每页记录数
			rs=pst.executeQuery();
			while(rs.next()){
				Books b=new Books();
				b.setBid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPress(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBrief(rs.getString(6));
				b.setType(rs.getInt(7));
				b.setInventory(rs.getInt(8));
				b.setCount(rs.getInt(9));
				b.setBdate(new java.util.Date(rs.getDate(10).getTime()));
				b.setRecommend(rs.getInt(11));
				b.setPic(rs.getString(12));
				bookslist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return bookslist;
	} 
	public Books listBookbyBid(int bid){ //根据bid查找图书
		Books b = new Books();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from books where bid =?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, bid);
			rs=pst.executeQuery();
			while(rs.next()){
				b.setBid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPress(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBrief(rs.getString(6));
				b.setType(rs.getInt(7));
				b.setInventory(rs.getInt(8));
				b.setCount(rs.getInt(9));
				b.setBdate(new java.util.Date(rs.getDate(10).getTime()));
				b.setRecommend(rs.getInt(11));
				b.setPic(rs.getString(12));
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
//	public static void main(String[] args) {
//		Books b = new Books();
//		b.setAuthor("22");
//		b.setBid(10);
//		b.setBookname("111");
//		b.setBrief("22");
//		b.setType("22");
//		b.setPress("22");
//		b.setPrice(22);
//		updateBook(b);
//	}
	public int updateBook(Books book){//修改图书信息
		Connection con=null;
		PreparedStatement pst=null;
		int rs=0;
		String sql="update books set bookname = ? , author=? , press=? , price=? ,brief=? , type=? ,inventory=?,recommend=? where bid=? ";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			
			pst.setString(1, book.getBookname());
			pst.setString(2, book.getAuthor());
			pst.setString(3, book.getPress());
			pst.setDouble(4, book.getPrice());
			pst.setString(5, book.getBrief());
			pst.setInt(6, book.getType());
			pst.setInt(7, book.getInventory());
			pst.setInt(8, book.getRecommend());
			pst.setInt(9, book.getBid());
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
	public int updatePic(String pic , int bid){//修改图书图片
		Connection con=null;
		PreparedStatement pst=null;
		int rs=0;
		String sql="update books set pic=? where bid=? ";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, pic);
			pst.setInt(2, bid);
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
	public int deleteBook(int bid) {//删除某图书信息
		int rs=0;
		Connection con=null;
		PreparedStatement pst=null;
		String sql="delete from books where bid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, bid);
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}
	
	public int addBook(Books b){//添加新书
		//User user = new User();
		int rs=0;

		Connection con=null;
		PreparedStatement pst=null;
		String sql="insert into books(bookname,author,press,price,brief,type,inventory,bdate,recommend,pic) values (?,?,?,?,?,?,?,Now(),?,?)";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, b.getBookname());
			pst.setString(2, b.getAuthor());
			pst.setString(3, b.getPress());
			pst.setDouble(4, b.getPrice());
			pst.setString(5, b.getBrief());
			pst.setInt(6, b.getType());
			pst.setInt(7, b.getInventory());
			pst.setInt(8, b.getRecommend());
			pst.setString(9, b.getPic());
			rs=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			DBUtil.close(con, pst, null);
		}
		return rs;
	}
	public int updateBookSum(int bid,int sum){//从购物车中删除某图书后，增加该图书的库存量
		Connection con=null;
		PreparedStatement pst=null;
		int rs=0;
		String sql="update books set inventory =inventory+? where bid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, sum);
			pst.setInt(2, bid);
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
	public int updateBookCount(int bid,int count){//用户支付后，增加该图书的销售量
		Connection con=null;
		PreparedStatement pst=null;
		int rs=0;
		String sql="update books set count =count+? where bid=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, count);
			pst.setInt(2, bid);
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
	public List<Integer> findBidByType(int type){ //根据图书id找对应中订单的状态
		List<Integer> booksid = new ArrayList<Integer>();
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select bid from books where type=?";
		try {
			con=DBUtil.getConnection();
			pst=con.prepareStatement(sql);
			pst.setInt(1, type);
			rs=pst.executeQuery();
			
			while(rs.next()){
				int bookInt=rs.getInt(1);
				booksid.add(bookInt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.close(con, pst, rs);
		}
		return booksid;
	}
//	public static void main(String[] args) {
//		System.out.println(updateBookCount(3,1));
//	}
	
//	public static void main(String[] args) {
//		List<Books> bookslist = listtypebooks("d");
//		
//		Iterator<Books> it = bookslist.iterator();
//		
//		while(it.hasNext()){
//			Books b = it.next();
//		System.out.println(b.getBookname()+"----------"+b.getBdate());
//		
//		}
//	}
}

