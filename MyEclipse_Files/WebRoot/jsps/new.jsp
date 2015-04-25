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

<title>My JSP 'top.jsp' starting page</title>

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
	font-size: 30px;
	text-align: left;
}

li{
	float: left;
	width: 400px;
	height: 350px;
}
ul {
	list-style-type: none;

}
li {
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
.cart{
	color: blue;
	text-decoration: underline;
	font-size: 16px;
	font-weight: bold;
}
.col{
	width: 70px;
}
tr{
	height: 40px;
}

</style>
</head>

<body>
	<p class="title">最新图书</p>
	<hr color="green" />

	<ul>
		<c:forEach items="${listbooks}" var="books">
			<li>
				<table>
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
						<td>${books.price}</td>
					</tr>
					<tr>
						<td class="col">简介：</td>
						<td>${books.brief}</td>
					</tr>
					<tr>
						<td class="col"></td>
						<td class="cart">加入购物车</td>
					</tr>
				</table>
			</li>
		</c:forEach>
	</ul>
</body>
</html>
