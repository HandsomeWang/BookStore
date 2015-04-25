<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
  .content{
		font-family: 微软雅黑;
		font-size: 50px;
		text-align: center;
		color: gray;
		padding: 10%,0;
	}
	.title {
	color: green;
	font-size: 25px;
	text-align: left;
}
  </style>
  </head>

  <body bgcolor=#cccccc>
<!--   <p class="title">
  —>首页
  </p>
  <hr color="green" /> -->
    <div class="content">欢迎来到Simple BookStore</div>
    
  </body>
</html>
