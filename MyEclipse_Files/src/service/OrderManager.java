package service;

import java.util.List;

import dao.OrderDao;
import dao.OrderItemDao;
import pojo.Order;
import pojo.OrderItem;

public class OrderManager {

	private OrderDao od = new OrderDao();
	private OrderItemDao oi = new OrderItemDao();
	public List<Order> listOrderByUid(String uid){ //按用户id列出该用户的所有订单（总订单和订单条目）
		return od.listOrderByUid(uid);
	}
	public  int findOidByUid(String uid){ //根据用户id查询最新订单的订单号
		return od.findOidByUid(uid);
	}
	public int addOder(String uid,double allprice){//添加总订单
		return od.addOder(uid, allprice);
	}
	public int addOrderItem(OrderItem o){//添加订单条目
		return oi.addOrderItem(o);
	}
	public int updateCart(int oid,int status){//修改订单状态
		return od.updateCart(oid, status);
	}
	public List<Integer> findOidByBid(int bid){ //根据图书id找对应中订单的状态
		return oi.findOidByBid(bid);
	}
	public List<Order> listAllOrder(){ //列出所有订单（总订单和订单条目，按提交订单时间排序）
		return od.listAllOrder();
	}
	public List<Order> listOrderByStatus(int status){ //列出某状态下的所有订单（总订单和订单条目，按提交订单时间排序）
		return od.listOrderByStatus(status);
	}
	public List<OrderItem> listOrderItemByOid(int oid){ //按订单id列出该id下的条目
		return oi.listOrderItemByOid(oid);
	}
}
