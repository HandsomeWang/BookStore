package action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import pojo.Cart;
import pojo.Order;
import pojo.OrderItem;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import service.BooksManager;
import service.CartManager;
import service.OrderManager;

public class OrderAction extends ActionSupport{
	private OrderManager om=new OrderManager();
	private CartManager cm=new CartManager();
	private BooksManager bm=new BooksManager();
	private String uid;
	private int status;
	private int oid;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String myorder() {
		uid = (String) ActionContext.getContext().getSession().get("uid");
		if(uid == null)
			return ERROR;
		List<Order> lo = om.listOrderByUid(uid);
		ActionContext.getContext().put("myorder", lo);
		return SUCCESS;
	}
	public String adminorder() {
		List<Order> l = om.listAllOrder();
		ActionContext.getContext().put("adminorder", l);
		return SUCCESS;
	}
	public String adminorder_s() {
		List<Order> l = om.listOrderByStatus(status);
		ActionContext.getContext().put("adminorder", l);
		return SUCCESS;
	}
	
	public String changestatus() {
		if(status==4){
			List<OrderItem> listoi=new ArrayList<OrderItem>();
			listoi=om.listOrderItemByOid(oid);
			Iterator<OrderItem> it = listoi.iterator();
			while(it.hasNext()){
				OrderItem oi = it.next();
				if(bm.updateBookSum(oi.getBid(), oi.getSum())==0)
					return ERROR;
			}
		}
		if(status==1){
			List<OrderItem> listoi=new ArrayList<OrderItem>();
			listoi=om.listOrderItemByOid(oid);
			Iterator<OrderItem> it = listoi.iterator();
			while(it.hasNext()){
				OrderItem oi = it.next();
				if(bm.updateBookCount(oi.getBid(), oi.getSum())==0)
					return ERROR;
			}
		}
		if (om.updateCart(oid, status)==0)
			return ERROR;
		return SUCCESS;
	}
	public String adminchangestatus() {
		
		if (om.updateCart(oid, status)==0)
			return ERROR;
		return SUCCESS;
	}
	public String addorder() {
		int key=0;
		uid = (String) ActionContext.getContext().getSession().get("uid");
		double allprice=0;
		
		List<Cart> lc1= cm.listCart(uid);
		Iterator<Cart> it1 = lc1.iterator();
		while(it1.hasNext()){
			Cart c = it1.next();
			allprice=allprice+c.getBooks().getPrice()*c.getSum();
		}
		key=om.addOder(uid, allprice);
		if(key==0)
			return ERROR;
		List<Cart> lc = cm.listCart(uid);
		Iterator<Cart> it = lc.iterator();
		while(it.hasNext()){
			Cart c = it.next();
			OrderItem o = new OrderItem();
		//	System.out.println("*********");
			o.setBid(c.getBooks().getBid());
		//	System.out.println(c.getBooks().getBid()+"------getBid");
			o.setBookname(c.getBooks().getBookname());
		//	System.out.println(c.getBooks().getBookname()+"--------bookname");
			o.setPrice(c.getBooks().getPrice());
		//	System.out.println(c.getBooks().getPrice()+"---------price");
			o.setSum(c.getSum());
		//	System.out.println(c.getSum()+"-------sum");
			o.setOid(om.findOidByUid(uid));
		//	System.out.println(om.findOidByUid(uid)+"----------oid");
			key=om.addOrderItem(o);
			if(key==0)
				return ERROR;
		}
		key=cm.deleteAllCart(uid);
		if(key==0)
			return ERROR;
		return SUCCESS;
	}
	
	
}
