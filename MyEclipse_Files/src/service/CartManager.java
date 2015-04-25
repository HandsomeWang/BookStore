package service;

import java.util.List;

import dao.BooksDao;
import dao.CartDao;

import pojo.Books;
import pojo.Cart;

public class CartManager {
	private CartDao cd = new CartDao();
	
	
	public int addBook(String uid,int bid) {//向购物车中添加图书
		int key = cd.ifExistBook(uid, bid);
		if(key==0){//如果购物车中没有该种类图书，则新增图书，数量初始为1；
			return cd.addNewBook(uid, bid);
		}
		else//如果购物车中已经有该种图书，则数量+1
			return cd.updateCart(uid, bid, ++key);

	}
	public int updateCart(String uid,int bid,int sum) {//手动修改购物车中某图书的数量
		return cd.updateCart(uid, bid, sum);
	}
	public List<Cart> listCart(String uid){
		return cd.listCart(uid);
	}
	public int deleteCart(String uid,int bid){
		return cd.deleteCart(uid, bid);
	}
	public int deleteAllCart(String uid) {//购物车中删除某用户的全部记录
		return cd.deleteAllCart(uid);
	}
	public int ifExistBook(String uid,int bid){ //用户购物车中是否存在该图书,返回该书的数量
		return cd.ifExistBook(uid, bid);
	}

}
