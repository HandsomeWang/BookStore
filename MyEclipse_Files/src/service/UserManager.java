package service;
import dao.UserDao;
import pojo.User;

public class UserManager {
	private UserDao ud = new UserDao();
	public int addUser(User u){
		
		if(u.getUid().isEmpty()||u.getName().isEmpty()||u.getAddr().isEmpty()||u.getIdcard().isEmpty()||u.getEmail().isEmpty()||u.getPost().isEmpty()){
			System.out.println(u.getUid()+"-------------");
			System.out.println(u.getName()+"-------------");
			System.out.println(u.getAddr()+"-------------");
			return 0;
		}
			
		return ud.addUser(u);
	}
	public int ifExistUser(String uid){
		return ud.ifExistUser(uid);
	}
	public int checkIfLogin(User u) {
		return ud.checkIfLogin(u);
	}
	public String findNameByUid(String uid){//根据uid找到用户名
		return ud.findNameByUid(uid);
	}
	public User findUserByUid(String uid){//根据uid找到用户信息
		return ud.findUserByUid(uid);
	}
	public int updateUser(User u){//修改用户信息(除了密码之外的信息)
		return ud.updateUser(u);
	}
	public int updatePwd(String pwd,String uid){//修改用户密码
		return ud.updatePwd(pwd, uid);
	}
}
