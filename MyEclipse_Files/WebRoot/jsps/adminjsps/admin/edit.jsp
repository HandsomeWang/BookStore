<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'edit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <style type="text/css">
* {
	font-family: 微软雅黑;
	font-size: 20px;
}
div{
	text-align: center;
}
.bid{
	background-color: gray;
}
.title {
	color: green;
	font-size: 25px;
	text-align: left;
}
.upbtn{
	width: 100px;
	height: 32px;
	font-size: 17px;
}
.left{
	float: left;
	
}
</style> 
  <body>
  <p class="title">
		—>修改图书信息
	</p>
	<hr color="green" />
	<div class="left">
			   
	<%if (!session.getAttribute("pic").equals("")) {%>
        <img width="150px" height="200px" src="${pic}"/>
        <%} else{%>
        <img width="150px" height="200px" src="${book.pic}"/>
        <%}%>
	<font color="red"><s:fielderror/></font>
        <s:form action="editpic.action" method="post" enctype="multipart/form-data" namespace="/">
            <s:file name="filepic" ></s:file>
            <s:submit class="upbtn" value="开始上传"/>
        </s:form>   

  
<%-- <c:if test="${pic.inventory<=0}"><span class="nobook">已售罄</span></c:if> --%>
  </div>
	
	
  <div>
  <form action="editsure.action" method="post">
   <table>
					<tr>
						<td class="col">ID：</td>
						<td >${book.bid}</td>
					</tr>
					<tr>
						<td class="col">书名：</td>
						<td ><input type="text" name="book.bookname" value="${book.bookname}"/></td>
					</tr>
					<tr>
						<td class="col">作者：</td>
						<td><input type="text" value="${book.author}" name="book.author"/></td>
					</tr>
					<tr>
						<td class="col">出版社：</td>
						<td><input type="text" value="${book.press}" name="book.press"/></td>
					</tr>
					<tr>
						<td class="col">价格：</td>
						<td><input type="text" value="${book.price}" name="book.price"/></td>
					</tr>
					<tr>
						<td class="col">简介：</td>
						<td><input type="text" value="${book.brief}" name="book.brief"/></td>
					</tr>
					<tr>
						<td class="col">库存量：</td>
						<td><input type="text" value="${book.inventory}" name="book.inventory"/></td>
					</tr>
					<tr>
						<td class="col">图书分类：</td>
						<td>
						
						<select class="select" name="book.type">
    					<c:forEach items="${listtype}" var="ltype">	
    					<c:if test="${book.type==ltype.tid }">
    						<option value="${ltype.tid}" selected="selected">${ltype.tname}</option>
    					</c:if>
    					<c:if test="${book.type!=ltype.tid }">
    						<option value="${ltype.tid}">${ltype.tname}</option>
    					</c:if>
    					</c:forEach>
    					</select>
						
						</td>
					</tr>	
					
					<tr>
					<td class="col">是否推荐：</td>
					<td>
					<select class="select" name="book.recommend">
					<c:if test="${book.recommend==1 }">
    						<option value="1" selected="selected">是</option>
    						<option value="0">否</option>
    					</c:if>
					<c:if test="${book.recommend==0 }">
    						<option value="0" selected="selected">否</option>
    						<option value="1">是</option>
    					</c:if>
							</select>
					</td>
					</tr>
									
					<tr>
						<td class="col"></td>
						<td class="bottom">
							<input type="submit" value="确定修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="javascript:history.back(-1)">取消</a>
						</td>
					</tr>
				</table>
				</form>
				</div>
  </body>
</html>
