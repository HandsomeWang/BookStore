<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'desc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
* {
	font-family: 微软雅黑;
}

.title {
	color: green;
	font-size: 25px;
	text-align: left;
}


.bookname{
	color: red;
	font-size: 17px;
	font-weight: bold;
	width: 500px;
}
.cart{
	color: blue;
	text-decoration: underline;
	font-size: 16px;
	font-weight: bold;
}
.nobook{
	color: gray;
	font-size: 16px;
	font-weight: bold;
}
.col{
	width: 90px;
}
.col2{
	width: 200px;
}
tr{
	height: 40px;
}
.pic{
	float:left;
	margin-left: 30px;
	margin-right: 30px;
	margin-top: 30px;
}
.breif{
	color: gray;
	font-size: 15px;
	width: 500px;
}
</style>
  </head>
  
  <body>
  <div class="pic">
  <img width="150px" height="200px" src="${books.pic}"/>
  </div>
    <table>
					<!-- <tr>
						<td colspan="2">
							<img width="150px" height="200px" src="images/default.jpg"/>
						</td>
					</tr> -->
					<tr>
						<td colspan="2" class="bookname">${books.bookname}</td>
					</tr>
					<tr>
						<td class="breif" colspan="2">${books.brief}</td>
					</tr>
					<tr>
						<td class="col">作者：</td>
						<td class="col2">${books.author}</td>
					</tr>
					<tr>
						<td class="col">出版社：</td>
						<td class="col2">${books.press}</td>
					</tr>
					<tr>
						<td class="col">价格：</td>
						<td class="col2">¥ ${books.price}</td>
					</tr>
					<tr>
						<td class="col">已售：</td>
						<td class="col2">${books.count} 本</td>
					</tr>
					
					<tr>
						
						<td class="col">
							<c:if test="${books.inventory<=0}"><span class="nobook">已售罄</span></c:if>
							<c:if test="${books.inventory>0}">
								<a class="cart" href="addcart.action?bid=${books.bid}">加入购物车</a>
							</c:if>
						</td>
						<td class="col2"></td>
					</tr>
				</table>
  </body>
</html>
