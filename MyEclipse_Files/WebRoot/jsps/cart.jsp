<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
table{
	text-align: center;
}
tr{
	height: 80px;
}
td{
	width: 200px;
}
.sumtext{
	width:30px;
}
.allprice{
	color: red;
	font-size: 20px;
	float: none;
}
.bt{
	margin-top:20px;
	width: 100px;
	height: 60px;
	font-size: 18px;
	font-weight: bold;
}
</style>

</head>
<script charset="UTF-8" src="/Books/jsps/js/cart.js"  language="javascript"></script>
<body>
	
	<c:choose>
	<c:when test="${mycart.isEmpty()}">
      <p>购物车中还没有任何物品<p>
	</c:when>
	<c:otherwise>
	<p class="title">—>我的购物车</p>
	<hr color="green" />
	<table>
		<tr>
			<td>图书编号</td>
			<td>名称</td>
			<td>作者</td>
			<td>出版社</td>
			<td>单价</td>
			<td>数量</td>
			<td>小计</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${mycart}" var="cart" varStatus="varcolor">
		  <c:if test="${varcolor.index % 2==0}">
				<tr style="background-color:#d0d0d0"></c:if>
<c:if test="${varcolor.index % 2==1}">
<tr style="background-color:#F0F0F0"></c:if>
				<td>${cart.books.bid}</td>
				<td>${cart.books.bookname}</td>
				<td>${cart.books.author}</td>
				<td>${cart.books.press}</td>
				<td>${cart.books.price}</td>
				<td><input name="sum" class="sumtext" type="text"  value="${cart.sum}"/></td>
				<td>
				<fmt:formatNumber value="${cart.books.price*cart.sum}" pattern="0.00"/> 
				</td>
				<td><a name="del" href="#">删除</a></td>

			</tr>

		</c:forEach>
	</table>
	<hr color="gray" />
	<div align="right">
	应付总额：
	<span id="allprice" class="allprice">
		<fmt:formatNumber value="${sumprice}" pattern="0.00"/> 
		</span>
	<div><a href="addorder.action?sumprice=" class="bt">提交订单</a></div>
	</div>
</c:otherwise>  
</c:choose>
</body>
</html>
