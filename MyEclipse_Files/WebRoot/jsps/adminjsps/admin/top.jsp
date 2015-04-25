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

</style>
  </head>
  
  <body>
    <h1 style="text-align: center;padding-top: 20px">A Simple BookStore——后台管理</h1>
    <div style="font-size: 13pt; line-height: 18px; text-align: center">
    <a href="shownote.action" target="body1">公告管理</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="showtype.action" target="body1">分类管理</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="jsps/adminjsps/admin/bookmanager.jsp" target="body1">图书管理</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="adminorder.action" target="body1">订单管理</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="adminmsg.action" target="body1">留言管理</a>
    </div>
    
  </body>
</html>
