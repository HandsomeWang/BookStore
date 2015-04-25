package action;

import java.util.List;

import pojo.Note;

import service.NoteManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NoteAction extends ActionSupport{
	NoteManager nm = new NoteManager();
	private String ncontent;
	private int nid;
	
	
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String shownote(){
		List<Note> listnote= nm.listAllNote();
		ActionContext.getContext().getSession().put("listnote", listnote);
		return SUCCESS;
	}
	public String addnote(){
		Note n = new Note();
		n.setNcontent(ncontent);
		String aid = (String) ActionContext.getContext().getSession().get("aid");
		n.setAid(aid);
		if(nm.addNewNote(n)==0)
			return ERROR;
		return SUCCESS;
	}
	public String deletenote(){
		if(nm.deleteNote(nid)==0)
			return ERROR;
		return SUCCESS;
	}
}
