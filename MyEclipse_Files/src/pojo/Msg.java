package pojo;
import java.util.Date;

import service.UserManager;

public class Msg {

	private int mid;
	private String uid;
	private String name;
	private String theme;
	private String context;
	private Date date;
	private UserManager um=new UserManager();
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {

		
		this.uid = uid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		
		this.name = name;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date2) {
		this.date = date2;
	}

	
}
