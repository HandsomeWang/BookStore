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
	height: 50px;
}
.bookname{
	width: 450px;
}
td{
	width: 100px;
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
.title{
	color: green;
	font-weight: bold;
	font-size: 18px;
}
</style>

</head>
<script charset="UTF-8" src="/Books/jsps/js/cart.js"  language="javascript"></script>
<body>
	
	<c:choose>
	<c:when test="${myorder.isEmpty()}">
      <p>您还没有订单记录，<a href="listhotbooksdetail.action">去书店逛逛</a><p>
	</c:when>
	<c:otherwise>
	<p class="title">—>我的订单</p>
	<hr color="green" />
	<c:forEach items="${myorder}" var="myorder" varStatus="varcolor">
			<c:if test="${varcolor.index % 2==0}">
				<div style="background-color:#E0E0E0">
			</c:if>
			<c:if test="${varcolor.index % 2==1}">
				<div style="background-color:#FCFCFC">
			</c:if>
	订单编号：<span class="title">${myorder.oid}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	下单时间：<span class="title"><fmt:formatDate value="${myorder.otime}" type="both"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	订单状态：<c:if test="${myorder.status==0}"><span class="title">订单已提交</span>&nbsp;&nbsp;
				<a href="changestatus.action?status=1&oid=${myorder.oid}">点击支付</a>&nbsp;&nbsp;
				<a href="changestatus.action?status=4&oid=${myorder.oid}">取消订单</a></c:if>
			<c:if test="${myorder.status==1}"><span class="title">已支付，等待发货</span>&nbsp;&nbsp;</c:if>
			<c:if test="${myorder.status==2}"><span class="title">已发货</span>&nbsp;&nbsp;
				<a href="changestatus.action?status=3&oid=${myorder.oid}">确认已收货</a></c:if>
			<c:if test="${myorder.status==3}"><span class="title">收货成功，交易完成</span></c:if>
			<c:if test="${myorder.status==4}"><span class="title">订单已取消</span></c:if>			
	<table>
		<tr>
			<td class="bookname">书名</td>
			<td>单价</td>
			<td>数量</td>
			<td>小计</td>
		</tr>
		<c:forEach items="${myorder.orderitem}" var="orderitem">
			<tr>
				<td class="bookname">${orderitem.bookname}</td>
				<td>${orderitem.price}</td>
				<td>${orderitem.sum}</td>
				<td>${orderitem.sumprice}</td>
			</tr>
		</c:forEach>
	</table>
	<div align="right">
	总计：<span id="allprice" class="allprice">${myorder.allprice}</span>
	</div>
	</div>
	</c:forEach>

</c:otherwise>  
</c:choose>
</body>
</html>
