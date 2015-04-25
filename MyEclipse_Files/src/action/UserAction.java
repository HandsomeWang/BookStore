package action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import pojo.User;
import service.UserManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private User u = new User();
	private UserManager um = new UserManager();
	private String uid;
	private InputStream yes=null;
	private InputStream no=null;
	private String oldpassword;
	private String newpassword;
	private String renewpassword;
	
	
	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getRenewpassword() {
		return renewpassword;
	}

	public void setRenewpassword(String renewpassword) {
		this.renewpassword = renewpassword;
	}

	public InputStream getYes() {
		String info="1";
		return new ByteArrayInputStream(info.getBytes());
	}

	public void setYes(InputStream yes) {
		this.yes = yes;
	}

	public InputStream getNo() {
		String info="0";
		return new ByteArrayInputStream(info.getBytes());
	}

	public void setNo(InputStream no) {
		this.no = no;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public User getU() {
		return u;
	}

	public void setU(User u) {
		this.u = u;
	}
	
	public String registaction(){
		int key = um.addUser(u);
		ActionContext.getContext().put("registinfo", key);
		return SUCCESS;
	}
	public String updateuser(){
		String uid = (String) ActionContext.getContext().getSession().get("uid");
		User u = new User();
		u=um.findUserByUid(uid);
		ActionContext.getContext().put("useroldinfo", u);
		return SUCCESS;
	}
	public String updateusersure(){
		String uid = (String) ActionContext.getContext().getSession().get("uid");
		u.setUid(uid);
		if(um.updateUser(u)==0)
			return ERROR;
		return SUCCESS;
	}
	public String updatepwd(){
		String uid = (String) ActionContext.getContext().getSession().get("uid");
		User user = new User();
		user.setUid(uid);
		user.setPassword(oldpassword);
		if(!newpassword.equals(renewpassword)){
			System.out.println("两次输入不一致");
			return ERROR;
		}
		if(um.checkIfLogin(user)==0){
			System.out.println("密码错了");
			return ERROR;
		}
		
		if(um.updatePwd(newpassword, uid)==0){
			System.out.println("出错啦");
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String check(){
		if(um.ifExistUser(uid)==0)
			return ERROR;
		return SUCCESS;
	}
	public String login(){
		int key =0;
		key= um.checkIfLogin(u);
		ActionContext.getContext().put("logininfo", key);
		if(key!=0)
			ActionContext.getContext().getSession().put("uid", u.getUid());
		return SUCCESS;
	}
	public String exit(){
		ActionContext.getContext().getSession().remove("uid");
		return SUCCESS;
	}
}
