package action;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import pojo.Cart;
import service.BooksManager;
import service.CartManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CartAction extends ActionSupport{
	
	private CartManager cm = new CartManager();
	private BooksManager bm = new BooksManager();
	private String uid;
	private int bid;
	private int sum;
	private InputStream yes=null;
	private InputStream no=null;

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
	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}




	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String addcart(){
		uid = (String) ActionContext.getContext().getSession().get("uid");
		if(uid == null)
			return "error1";
		else{
			if( cm.addBook(uid, bid)==0)
				return "error2";
			return SUCCESS;
		}
	}
	public String mycart(){
		double sum=0;
		uid = (String) ActionContext.getContext().getSession().get("uid");
		if(uid == null)
			return ERROR;
		List<Cart> lc= cm.listCart(uid);
		ActionContext.getContext().getSession().put("mycart", lc);
		Iterator<Cart> it = lc.iterator();
		while(it.hasNext()){
			Cart c = it.next();
			sum=sum+c.getBooks().getPrice()*c.getSum();
		}
		ActionContext.getContext().getSession().put("sumprice", sum);
		return SUCCESS;
	}
	public String changesum(){
		uid = (String) ActionContext.getContext().getSession().get("uid");
		if(cm.updateCart(uid, bid, sum)==0)
			return ERROR;
		return SUCCESS;
	}
	public String deleteitem(){
		uid = (String) ActionContext.getContext().getSession().get("uid");
		int booksum=cm.ifExistBook(uid, bid);
		int key = bm.updateBookSum(bid, booksum);
		if(key==0)
			return ERROR;
		else if(cm.deleteCart(uid, bid)==0)
			return ERROR;
		return SUCCESS;
	}

	

}
