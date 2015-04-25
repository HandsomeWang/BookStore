package pojo;

import java.text.DecimalFormat;

public class OrderItem {

	private int oiid;
	private int bid;
	private String bookname;
	private double price;
	private int sum;
	private int oid;
	private double sumprice;
	
	public double getSumprice() {
		DecimalFormat df = new DecimalFormat("#.00");
		return  Double.valueOf(df.format(getPrice()*getSum()));
	}

	public int getOiid() {
		return oiid;
	}
	public void setOiid(int oiid) {
		this.oiid = oiid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}


}