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
	body{
		margin-top: 20px;
	}
	.inputtext{
		width: 150px;
	}
	.submitbtn{
		width: 80px;
		height: 25px;
		margin-top: 10px;
	}
	</style>
  </head>
  
  <body >
    <form action="adminlogin.action" method="post">
    	<table>
    		<tr>
    			<td>管理员ID:</td>
    			<td><input class="inputtext" type="text" name="a.aid" /></td>
    		</tr>
    		<tr>
    			<td>密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码:</td>
    			<td><input class="inputtext" type="password" name="a.apwd"/></td>
    		</tr>
    	</table>
    	<input class="submitbtn" type="submit" value="登陆"/>
    </form>
  </body>
</html>
