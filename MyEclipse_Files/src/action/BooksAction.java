package action;

import java.awt.print.Book;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import pojo.Books;
import pojo.Btype;
import pojo.Cart;
import pojo.PageBean;
import service.BooksManager;
import service.BtypeManager;
import service.OrderManager;
import service.PageConstants;


public class BooksAction extends ActionSupport {
	private List<Books> listbooks;
	private BooksManager bm=new BooksManager();
	private OrderManager om=new OrderManager();
	private BtypeManager tm=new BtypeManager();
	private int typeid;
	private String field;
	private int type=-1;
	private String condition;
	private String field1;
	private int type1=-1;
	private String condition1;
	private int bid;
	private Books book;
	private PageBean pb = new PageBean();
	private int pc=1;
	
	
	public int getPc() {
		return pc;
	}
	public void setPc(int pc) {
		this.pc = pc;
	}

	public String getField1() {
		return field1;
	}
	public void setField1(String field1) {
		this.field1 = field1;
	}
	public int getType1() {
		return type1;
	}
	public void setType1(int type1) {
		this.type1 = type1;
	}
	public String getCondition1() {
		return condition1;
	}
	public void setCondition1(String condition1) {
		this.condition1 = condition1;
	}
	public Books getBook() {
		return book;
	}
	public void setBook(Books book) {
		this.book = book;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public List<Books> getListbooks() {
		return listbooks;
	}
	public void setListbooks(List<Books> listbooks) {
		this.listbooks = listbooks;
	}

//	public String listhotbooks(){
//		listbooks = bm.listHotBooks(1);
//		return SUCCESS;
//	}
	

		private File filepic;      //接收这个上传的文件
		private String filepicFileName;     //Struts2提供的格式，在文件名后+FileName就是上传文件的名字
		public File getFilepic() {
			return filepic;
		}
		public void setFilepic(File filepic) {
			this.filepic = filepic;
		}
		public String getFilepicFileName() {
			return filepicFileName;
		}
		public void setFilepicFileName(String filepicFileName) {
			this.filepicFileName = filepicFileName;
		}
		 
		public String addpic() throws Exception {
			System.out.println("------file------"+filepic);
			System.out.println("------filename------"+filepicFileName);
			String[] str = { ".jpg", ".jpeg", ".bmp", ".gif" };
			//限定文件大小是4MB
			if(filepic==null || filepic.length()>4194304 ){
				return ERROR;
			}

			for (String s : str) {
				if (filepicFileName.endsWith(s)) {
					String realPath = ServletActionContext.getServletContext().getRealPath("/images");//实际路径
				//	System.out.println("realPath---------"+realPath);
					File saveFile = new File(new File(realPath),filepicFileName);  //在该实际路径下实例化一个文件
					//判断父目录是否存在
					if(!saveFile.getParentFile().exists()){
						saveFile.getParentFile().mkdirs();
					}
					try {
						//执行文件上传
						FileUtils.copyFile(filepic, saveFile);
						
					} catch (IOException e) {
						return ERROR;
					}
				}
			}
			String pic = "images/"+filepicFileName;
			ActionContext.getContext().getSession().put("pic", pic);
			return SUCCESS;
		}
		public String editpic() throws Exception {
			System.out.println("------file------"+filepic);
			System.out.println("------filename------"+filepicFileName);
			String[] str = { ".jpg", ".jpeg", ".bmp", ".gif" };
			//限定文件大小是4MB
			if(filepic==null || filepic.length()>4194304 ){
				return ERROR;
			}
			
			for (String s : str) {
				if (filepicFileName.endsWith(s)) {
					String realPath = ServletActionContext.getServletContext().getRealPath("/images");//实际路径
					//	System.out.println("realPath---------"+realPath);
					File saveFile = new File(new File(realPath),filepicFileName);  //在该实际路径下实例化一个文件
					//判断父目录是否存在
					if(!saveFile.getParentFile().exists()){
						saveFile.getParentFile().mkdirs();
					}
					try {
						//执行文件上传
						FileUtils.copyFile(filepic, saveFile);
						
					} catch (IOException e) {
						return ERROR;
					}
				}
			}
			String pic = "images/"+filepicFileName;
			int bid = (Integer) ActionContext.getContext().getSession().get("bid");
			if(bm.updatePic(pic,bid)==0)
				return ERROR;
			ActionContext.getContext().getSession().put("pic", pic);
			return SUCCESS;
		}





	
	public String listhotbooksdetail(){
		listbooks = bm.listHotBooks(pc);
		
		int tr = bm.allBooks();//总记录数
		HttpServletRequest req = ServletActionContext.getRequest(); 
		String url=getUrl(req);//url地址
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		pb.setUrl(url);
		
		ActionContext.getContext().put("pb", pb);
		ActionContext.getContext().put("key", "hot");
		return SUCCESS;
	}
	public String listnewbooks(){
		System.out.println(pc+"*************************************pc");
		listbooks = bm.listNewBooks(pc);
		
		int tr = bm.allBooks();//总记录数
		HttpServletRequest req = ServletActionContext.getRequest(); 
		String url=getUrl(req);//url地址
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		pb.setUrl(url);
		
		ActionContext.getContext().put("pb", pb);
		
		ActionContext.getContext().put("key", "new");
		return SUCCESS;
	}
	public String listrecommend(){
		System.out.println(pc+"*************************************pc");
		listbooks = bm.listrecommend(pc);
		
		int tr = bm.allRecommend();//总记录数
//		System.out.println(tr+"-----------总记录数");
		HttpServletRequest req = ServletActionContext.getRequest(); 
		String url=getUrl(req);//url地址
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		pb.setUrl(url);
		
		ActionContext.getContext().put("pb", pb);
		
		ActionContext.getContext().put("key", "rec");
		return SUCCESS;
	}
	public String desc(){
		Books bookdesc = new Books();
		bookdesc=bm.listBookbyBid(bid);
		ActionContext.getContext().put("books", bookdesc);
		return SUCCESS;
	}
	public String userselect(){

		if(type==-1){
		field=(String) ActionContext.getContext().getSession().get("field");
		type= (Integer) ActionContext.getContext().getSession().get("type");
		condition=(String) ActionContext.getContext().getSession().get("condition");
		}
		listbooks = bm.listSpecialBooks(field, type, condition,pc);
		int tr = bm.listSpecialBooksCount(field, type, condition);//总记录数
		HttpServletRequest req = ServletActionContext.getRequest(); 
		String url=getUrl(req);//url地址
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		pb.setUrl(url);
		ActionContext.getContext().put("pb", pb);	
		if(listbooks.isEmpty())
			return ERROR;
		else{
			ActionContext.getContext().put("key", "select");
			ActionContext.getContext().getSession().put("field", field);
			String type_t=tm.findTypebytTd(type).getTname();
			ActionContext.getContext().getSession().put("type_t", type_t);
			ActionContext.getContext().getSession().put("type", type);
			ActionContext.getContext().getSession().put("condition", condition);
			return SUCCESS;
			}
	}
	public String adminselect(){
		
		if(type1==-1){
			field1=(String) ActionContext.getContext().getSession().get("field1");
			type1= (Integer) ActionContext.getContext().getSession().get("type1");
			condition1=(String) ActionContext.getContext().getSession().get("condition1");
		}
		listbooks = bm.listSpecialBooks(field1, type1, condition1,pc);
		int tr = bm.listSpecialBooksCount(field1, type1, condition1);//总记录数
		HttpServletRequest req = ServletActionContext.getRequest(); 
		String url=getUrl(req);//url地址
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		pb.setUrl(url);
		ActionContext.getContext().put("pb", pb);

		if(listbooks.isEmpty())
			return ERROR;
		else{
			ActionContext.getContext().getSession().put("field1", field1);
			String type1_t=tm.findTypebytTd(type1).getTname();
			ActionContext.getContext().getSession().put("type1", type1);
			ActionContext.getContext().getSession().put("type1_t", type1_t);
			ActionContext.getContext().getSession().put("condition1", condition1);
			ActionContext.getContext().getSession().put("pic", "");
			ActionContext.getContext().getSession().put("bid", -1);
			return SUCCESS;
		}
	}
	public String edit(){
		int status = (Integer) ActionContext.getContext().getSession().get("bid");
		if(status!=-1)
			bid=status;
		ActionContext.getContext().getSession().put("bid", bid);
		Books b  = bm.listBookbyBid(bid);
		ActionContext.getContext().put("book", b);
		
		List<Btype> listtype = new ArrayList<Btype>();
		listtype=tm.listAllType();
		ActionContext.getContext().getSession().put("listtype", listtype);
		
		return SUCCESS;
	}
	
	
	
	
	public String addbook(){
		int key=0;
		String pic = (String) ActionContext.getContext().getSession().get("pic");
		book.setPic(pic);
		key=bm.addBook(book);
		if(key==0)
			return ERROR;
		return SUCCESS;
	}
	public String editsure(){
		int key=0;
		bid=(Integer) ActionContext.getContext().getSession().get("bid");
		book.setBid(bid);
		key=bm.updateBook(book);
		if(key==0)
			return ERROR;
		ActionContext.getContext().getSession().put("pic", "");
		ActionContext.getContext().getSession().put("bid", -1);
		return SUCCESS;
	}
	public String delete(){
		List<Integer> statusList = new ArrayList<Integer>();
		statusList=om.findOidByBid(bid);
		if(statusList.size()==0){
			if(bm.deleteBook(bid)==0)
			 return "error1";//删除失败
			else
				return SUCCESS;
		}
		else{
			Iterator<Integer> it = statusList.iterator();
			while(it.hasNext()){
				int i = it.next();
				if(i==0||i==1||i==2)
					return "error2";//在未完成的订单中还有该图书，不能删除
			}
			if(bm.deleteBook(bid)==0)
				 return "error1";//删除失败
				else
					return SUCCESS;
		}
	}
	
	public String type(){
		listbooks = bm.listTypeBooks(typeid,pc);
		
		int tr = bm.listTypeBooksCount(typeid);//总记录数
		HttpServletRequest req = ServletActionContext.getRequest(); 
		String url=getUrl(req);//url地址
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		pb.setUrl(url);

		ActionContext.getContext().put("pb", pb);

		if(listbooks.isEmpty())
			return ERROR;
		String type_t=tm.findTypebytTd(typeid).getTname();
		ActionContext.getContext().put("key", type_t);
		return SUCCESS;
	}
	private String getUrl(HttpServletRequest req) {
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
		String url=null;
		url = req.getRequestURI() + "?" + req.getQueryString();
		int index = url.lastIndexOf("pc=");
		if(index != -1)
			url = url.substring(0, index);

		return url;
	}
}
