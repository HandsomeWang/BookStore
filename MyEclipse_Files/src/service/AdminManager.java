package service;

import pojo.Admin;
import dao.AdminDao;


public class AdminManager {
	private AdminDao a = new AdminDao();
	public int checkIfLogin(Admin ad){
		//根据传入的用户名、密码判断是否登录成功
		return a.checkIfLogin(ad);
	}
}
