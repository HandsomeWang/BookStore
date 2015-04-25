package service;

import java.util.List;

import dao.MsgDao;

import pojo.Msg;

public class MsgManager {
	
	private MsgDao md=new MsgDao();
	public List<Msg> listAllMsg(){
		return  md.listAllMag();
	}
	
	public int addNewMsg(Msg msg) {
		return md.addNewMsg(msg);
	}
	public int deleteMsg(int mid){//删除留言
		return md.deleteMsg(mid);
	}
}
