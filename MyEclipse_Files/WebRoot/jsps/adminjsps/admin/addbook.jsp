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
		—>添加图书
	</p>
	<hr color="green" />
  <div>
  <br/><br/>
 <div class="left">
   
	<font color="red"><s:fielderror/></font>
        <s:form action="addpic.action" method="post" enctype="multipart/form-data" namespace="/">
            <s:file name="filepic" ></s:file>
            <s:submit class="upbtn" value="开始上传"/>
        </s:form>   
        
        <%if (!session.getAttribute("pic").equals("")) {%>
        <img width="150px" height="200px" src="${pic}"/>
        <%} %>
  
<%-- <c:if test="${pic.inventory<=0}"><span class="nobook">已售罄</span></c:if> --%>
  </div>
  <form action="addbook.action" method="post">
   <table>
					
					<tr>
						<td class="col">书名：</td>
						<td ><input type="text" name="book.bookname"/></td>
					</tr>
					<tr>
						<td class="col">作者：</td>
						<td><input type="text" name="book.author"/></td>
					</tr>
					<tr>
						<td class="col">出版社：</td>
						<td><input type="text" name="book.press"/></td>
					</tr>
					<tr>
						<td class="col">价格：</td>
						<td><input type="text" name="book.price"/></td>
					</tr>
					<tr>
						<td class="col">简介：</td>
						<td><input type="text"  name="book.brief"/></td>
					</tr>
					<tr>
						<td class="col">库存量：</td>
						<td><input type="text" name="book.inventory"/></td>
					</tr>
					<tr>
						<td class="col">图书分类：</td>
						<td>
							<select class="select" name="book.type">
								<c:forEach items="${listtype}" var="ltype">
									<option value="${ltype.tid}">${ltype.tname}</option>
								</c:forEach>
							</select> 
					</td>
					</tr>
				
				<tr>
					<td class="col">是否推荐：</td>
					<td><select class="select" name="book.recommend">
							<option value="0">否</option>
							<option value="1">是</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<td class="col"></td>
					<td class="bottom"><input class="upbtn" type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:history.back(-1)">取消</a></td>
				</tr>
			</table>
				</form>
				</div>
  </body>
</html>
