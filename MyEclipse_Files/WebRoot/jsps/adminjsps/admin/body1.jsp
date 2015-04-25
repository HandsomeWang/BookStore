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
		font-size: 20px;
		background: #19B69A;
	}
	#parent {padding: 5% 0;
}
	
	.welcome{
		color: white;
		text-align: center;
		padding: 10% 0;


	}
	</style>
  </head>
  
  <body>
  <div id="parent">
  
    <div class="welcome">欢迎来到<br/>Simple BookStore  后台管理系统</div>
    </div>
  </body>
</html>
