<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'itemtype.jsp' starting page</title>
    
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
	.title {
	color: green;
	font-size: 25px;
	text-align: left;
}
	</style>
  </head>
  
  <body>
    <p class="title">分类管理——>编辑分类名</p>
	<hr color="green" />
	<form action="updatetypesure.action" method="post">
		<input type="text" value="${typeitem.tname }" name="tname"/>
		<input type="submit" value="确认更改">
		<a href="showtype.action">返回</a>
	</form>
  </body>
</html>
