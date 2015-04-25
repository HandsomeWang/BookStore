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
	<link rel="stylesheet" type="text/css" href="/Books/jsps/pager/pager.css">
<style type="text/css">
* {
	font-family: 微软雅黑;
}
body{
	padding: 0;
	margin: 0;
}

.title {
	color: green;
	font-size: 25px;
	text-align: left;
}

li{
	float: left;
	width: 200px;
	height: 300px;
}
ul {
	list-style-type: none;
	margin-left: 5px;
	padding: 0;
}
li {
	 margin-bottom: 10px;
	margin-left: 20px;
	padding:15px; 
}

.bookname{
	font-size: 15px;
color:blue;
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
tr{
	height: 20px;
}
.price{
	color:red;
	font-weight: bold;
	font-size: 15px;
}
.author{
	font-size: 13px;
}
.count{
	font-size: 13px;
	color: #5B5B5B;
}

</style>
</head>

<body >
	<p class="title">
		<%if (request.getAttribute("key").equals("hot")) {%>
		—>热点图书
		<%}else if(request.getAttribute("key").equals("new")){ %>
		—>最新图书
		<%}else if(request.getAttribute("key").equals("rec")){ %>
		—>鼎力推荐
		<%}else if(request.getAttribute("key").equals("select")){ 
		if(session.getAttribute("condition").equals(""))  {%>
		—>关键字查询—>输入为空：
		<%}else { %>
		—>关键字查询—>
		<%if (!session.getAttribute("type_t").equals("选择分类")) {%>
		在“${type_t}”分类中，
		<%} 
		if (!session.getAttribute("field").equals("检索方式")) {%>
		${field}中
		<%}%>
		含有“${condition}”的所有结果为：
		<%}}
		else
		{%>—>分类浏览—>${key}类图书：<%} %>

	</p>
	<hr color="green" />

	<ul>
	<div class="lidiv">
		 <c:forEach items="${listbooks}" var="books" varStatus="varcolor">
		<%--
			<c:if test="${varcolor.index % 5==0}">
				<li style="background-color:#FFC78E"></c:if>
<c:if test="${varcolor.index % 5==1}">
<li style="background-color:#FFDCB9"></c:if>

<c:if test="${varcolor.index % 5==2}">
<li style="background-color:#FFC78E"></c:if>

<c:if test="${varcolor.index % 5==3}">
<li style="background-color:#FFC78E"></c:if>
<c:if test="${varcolor.index % 5==4}">
<li style="background-color:#FFBB77"></c:if> --%>
<li>
				<table>
					
					<tr>
						<td>
							<a class="cart" href="desc.action?bid=${books.bid}">
								<img width="150px" height="200px" src="${books.pic}" border="0"/>
								</a>
						</td>
					</tr>
					<tr>
						<td class="price">¥ ${books.price}</td>
					</tr>
					<tr>
						<td >
							<a class="bookname" href="desc.action?bid=${books.bid}">
								<c:if test="${books.bookname.length()>9}">
									${books.bookname.substring(0,9)}...
									</c:if>
								<c:if test="${books.bookname.length()<=9}">
									${books.bookname}
								</c:if>
							</a>
						</td>
					</tr>
					<tr>
						<td class="author">
						<c:if test="${books.author.length()>10}">
									${books.author.substring(0,10)}...
									</c:if>
								<c:if test="${books.author.length()<=10}">
									${books.author}
								</c:if>
						著</td>
					</tr>

					
					<tr>
						<td class="count">已售 ${books.count} 本</td>
					</tr>
					 <tr>
						<td >
							<c:if test="${books.inventory<=0}"><span class="nobook">已售罄</span></c:if>
							<c:if test="${books.inventory>0}">
								<a class="cart" href="addcart.action?bid=${books.bid}">加入购物车</a>
							</c:if>
						</td>
					</tr> 
				</table>
			</li>
		</c:forEach>
		</div>
	</ul>
	<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/jsps/pager/pager.jsp" %>
</div>
</body>
</html>
