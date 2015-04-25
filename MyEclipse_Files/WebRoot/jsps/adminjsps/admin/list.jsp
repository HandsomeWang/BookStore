<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

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

ul {
	list-style-type: none;
}
li {
float: left;
	width: 550px;
	height: 370px;
	margin-bottom: 5px;
	margin-left: 5px;
	padding:10px;
	background: #FFDEAD ;
}
.bookname{
	color: red;
	font-size: 17px;
	font-weight: bold;
}
.bottom{
	text-align: center;
	margin: 0;
}
a{
color: blue;
		text-transform:none;
		text-decoration:none;
		font-size: 25px;
		font-weight: 900;
	} 
.col{
	width: 80px;
}
tr{
	height: 35px;
}



</style>
</head>

<body>
	<p class="title">
		<%  
		if(session.getAttribute("condition1").equals(""))  {%>
		—>关键字查询—>输入为空：
		<%}else { %>
		—>关键字查询—>
		<%if (!session.getAttribute("type1_t").equals("选择分类")) {%>
		在“${type1_t}”分类中，
		<%} 
		if (!session.getAttribute("field1").equals("检索方式")) {%>
		${field1}中
		<%}%>
		含有“${condition1}”的所有结果为：
		<%}%>
		

	</p>
	<hr color="green" />

	<ul>
		<c:forEach items="${listbooks}" var="books">
			<li>
			<div style="float:left;">
  <img width="150px" height="200px" src="${books.pic}"/>
  <div class="bottom">
			<a href="edit.action?bid=${books.bid}">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="delete.action?bid=${books.bid}">删除</a>
							</div>
  </div>
				<table>
					<tr>
						<td class="col">ID：</td>
						<td class="bookname">${books.bid}</td>
					</tr>
					<tr>
						<td class="col">书名：</td>
						<td class="bookname">${books.bookname}</td>
					</tr>
					<tr>
						<td class="col">作者：</td>
						<td>${books.author}</td>
					</tr>
					<tr>
						<td class="col">出版社：</td>
						<td>${books.press}</td>
					</tr>
					<tr>
						<td class="col">价格：</td>
						<td>¥ ${books.price}</td>
					</tr>
					<tr>
						<td class="col">库存量：</td>
						<td>${books.inventory} 本</td>
					</tr>
				<%-- 	<tr>
						<td class="col">简介：</td>
						<td>${books.brief}</td>
					</tr>
					<tr>
						<td class="col"></td>
						<td class="bottom">
							<a href="edit.action?bid=${books.bid}">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="delete.action?bid=${books.bid}">删除</a>
						</td>
					</tr> --%>
				</table>
				<p>简介&nbsp;&nbsp;：&nbsp;&nbsp;${books.brief}</p>
			</li>
			
			
		</c:forEach>
	</ul>
	<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/jsps/pager/pager.jsp" %>
</div>
</body>
</html>
