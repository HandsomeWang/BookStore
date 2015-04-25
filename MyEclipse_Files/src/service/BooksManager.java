package service;

import java.util.List;

import dao.BooksDao;

import pojo.Books;

public class BooksManager {
	private BooksDao bd = new BooksDao();
	
	public int allBooks(){//查询所有图书数量
		return bd.allBooks();
	}
	public int listSpecialBooksCount(String field,int type,String condition){ //按检索条件查询图书总数
		if(field.equals("书名"))
			field="bookname";
		else if(field.equals("作者"))
			field="author";
		else if(field.equals("出版社"))
			field="press";
		return bd.listSpecialBooksCount(field, type, condition);
	}
	public int listTypeBooksCount(int type){ //按分类查找图书的总数
		return bd.listTypeBooksCount(type);
	}
	public List<Books> listHotBooks(int pc){ //热点图书
		return bd.listHotBooks(pc);
	}
	public List<Books> listNewBooks(int pc){ //新书浏览
		return bd.listNewBooks(pc);
	}
	public List<Books> listrecommend(int pc){ //查找所有推荐的图书
		return bd.listrecommend(pc);
	}
	public int allRecommend(){ //查询推荐图书的总数
		return bd.allRecommend();
	}
	public List<Books> listSpecialBooks(String field,int type,String condition,int pc){ //制定条件查询图书
		if(field.equals("书名"))
			field="bookname";
		else if(field.equals("作者"))
			field="author";
		else if(field.equals("出版社"))
			field="press";
		return bd.listSpecialBooks(field, type, condition,pc);
	}
	public List<Books> listTypeBooks(int type,int pc){ //分类查找图书
		
		return bd.listTypeBooks(type,pc);
	}
	public Books listBookbyBid(int bid){ //根据bid查找图书
		return bd.listBookbyBid(bid);
	}
	public int updateBook(Books book){//修改图书信息
		return bd.updateBook(book);
	}
	public int updatePic(String pic , int bid){//修改图书图片
		return bd.updatePic(pic, bid);
	}
	public int deleteBook(int bid) {//删除某图书信息
		return bd.deleteBook(bid);
	}
	public int addBook(Books b){//添加新书
		return bd.addBook(b);
	}
	public int updateBookSum(int bid,int sum){//从购物车中删除某图书后，增加该图书的库存量
		return bd.updateBookSum(bid, sum);
	}
	public int updateBookCount(int bid,int count){//用户支付后，增加该图书的销售量
		return bd.updateBookCount(bid, count);
	}
}
