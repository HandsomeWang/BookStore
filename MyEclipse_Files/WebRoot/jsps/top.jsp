<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

	*{
		font-family: 微软雅黑;
	}
	body {
		background: #15B69A;
		margin: 0px;
		color: #ffffff;
	}
	a{
		text-transform:none;
		text-decoration:none;
		color: #ffffff;
		font-weight: 900;
	} 
	a:HOVER {
		text-decoration:underline;
	}
	.cart{
		color: blue;
	}
	.order{
		color: yellow;
	}
</style>
  </head>
  
  <body>
    <p style="text-align: center;padding-top: 3px;font-size: 20pt;font-weight: bold;">A Simple BookStore</p>
    <div style="font-size: 12pt; line-height: 15px; text-align: center;">
    <a href="index.jsp" target="body">书店首页</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="listnewbooks.action?pc=1" target="body">新书浏览</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="listhotbooksdetail.action?pc=1" target="body">畅销书榜</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="listrecommend.action?pc=1" target="body">鼎力推荐</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="/Books/jsps/regist.jsp" target="_blank">用户注册</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="msg.action" target="body">我要留言</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="mycart.action" target="body" class="cart">我的购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="myorder.action" target="body" class="order">我的订单</a>
    </div>
    
  </body>
</html>
