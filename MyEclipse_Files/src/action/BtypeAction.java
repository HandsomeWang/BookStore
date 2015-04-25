package action;

import java.util.ArrayList;
import java.util.List;

import pojo.Btype;
import pojo.Note;

import service.BtypeManager;
import service.NoteManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BtypeAction extends ActionSupport{

	private BtypeManager tm=new BtypeManager();
	private String newtypename;
	private int tid;
	private String tname;
	
	
	
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getNewtypename() {
		return newtypename;
	}
	public void setNewtypename(String newtypename) {
		this.newtypename = newtypename;
	}
	public String showsearch(){
		List<Btype> listtype = new ArrayList<Btype>();
		listtype=tm.listAllType();
		ActionContext.getContext().getSession().put("listtype", listtype);
		ActionContext.getContext().getSession().put("pic", "");
		return SUCCESS;
	}
	public String showdynamic(){
		List<Btype> listtype = new ArrayList<Btype>();
		listtype=tm.listAllType();
		listtype.remove(listtype.get(0));
		ActionContext.getContext().getSession().put("listtype1", listtype);
		
		NoteManager nm = new NoteManager();
		Note n = nm.listLastNote();
		ActionContext.getContext().getSession().put("lastnote", n);
		return SUCCESS;
	}
	public String addtype(){
		if(tm.addType(newtypename)==0)
			return ERROR;
		return SUCCESS;
	}
	public String deletetype(){
		List<Integer> booksList = new ArrayList<Integer>();
		booksList=tm.findBidByType(tid);
		if(booksList.size()==0){
			if(tm.deleteType(tid)==0)
				return "error1";//删除失败
			return SUCCESS;
		}
		else
			return "error2";//该类型下还存在一本或多本图书，不能删除该类型
	}
	public String itemtype(){
		Btype t=new Btype();
		t=tm.findTypebytTd(tid);
		ActionContext.getContext().getSession().put("typeitem", t);
		return SUCCESS;
	}
	public String updatetypesure(){
		Btype t=new Btype();
		t=(Btype) ActionContext.getContext().getSession().get("typeitem");
	//	System.out.println("id-----"+t.getTid()+"-------name______"+t.getTname());
		if(tm.updatetype(t.getTid(),tname)==0)
			return ERROR;
		return SUCCESS;
	}
}
