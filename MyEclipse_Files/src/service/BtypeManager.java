package service;

import java.util.List;

import pojo.Btype;
import dao.BooksDao;
import dao.BtypeDao;

public class BtypeManager{
	private BtypeDao td=new BtypeDao();
	private BooksDao bd=new BooksDao();
	public Btype findTypebytTd(int tid){ //根据tid查找类型
		return td.findTypebytTd(tid);
	}
	public List<Btype> listAllType(){ //列出所有类型
		return td.listAllType();
	}
	public int addType(String tname){//添加新类型
		return td.addType(tname);
	}
	public int deleteType(int tid){//删除新类型
		return td.deleteType(tid);
	}
	public List<Integer> findBidByType(int type){ //根据图书id找对应中订单的状态
		return bd.findBidByType(type);
	}
	public int updatetype(int tid,String tname){//根据类型id更新某类型名
		return td.updatetype(tid,tname);
	}
}
