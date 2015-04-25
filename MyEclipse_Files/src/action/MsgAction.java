package action;
import java.util.List;

import pojo.Msg;
import service.MsgManager;
import service.UserManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MsgAction extends ActionSupport{
	private String uid;
	private MsgManager mm=new MsgManager();
	private UserManager um=new UserManager();
	private Msg m;
	private int mid;
	
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public MsgManager getMm() {
		return mm;
	}
	public void setMm(MsgManager mm) {
		this.mm = mm;
	}

	public Msg getM() {
		return m;
	}
	public void setM(Msg m) {
		this.m = m;
	}
	public String msg(){
		uid = (String) ActionContext.getContext().getSession().get("uid");
		if(uid == null)
			return ERROR;
		
		List<Msg> msglist = mm.listAllMsg();
		
		ActionContext.getContext().getSession().put("msglist", msglist);
		return SUCCESS;
	}
	public String adminmsg(){
		List<Msg> msglist = mm.listAllMsg();
		ActionContext.getContext().getSession().put("msglist", msglist);
		return SUCCESS;
	}
	public String deletemsg(){
		if(mm.deleteMsg(mid)==0)
			return ERROR;
		return SUCCESS;
	}
	public String addmsg(){
		uid = (String) ActionContext.getContext().getSession().get("uid");
		
		m.setUid(uid);
	//	System.out.println(m.getName()+"**********");
		int key = mm.addNewMsg(m);
		if (key==0){
			return ERROR;
		}
		return SUCCESS;
		
	}
}
