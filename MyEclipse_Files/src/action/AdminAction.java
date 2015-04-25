package action;

import pojo.Admin;
import service.AdminManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport{
	private AdminManager am=new AdminManager();
	private Admin a = new Admin();
	

	public Admin getA() {
		return a;
	}

	public void setA(Admin a) {
		this.a = a;
	}

	public String adminlogin() {
		if(am.checkIfLogin(a)==0)
			return ERROR;
		String aid = a.getAid();
		ActionContext.getContext().getSession().put("aid", aid);
		return SUCCESS;
	}
}
