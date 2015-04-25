<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'logininfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style type="text/css">
	*{
		font-family: 微软雅黑;
		font-size: 15px;
	}
	</style>
    <body bgcolor=#ff9900>
   <% if(request.getAttribute("logininfo").equals(0)){%>
   用户名或密码错误，请<a href="jsps/showlogin.jsp">重新登录</a>
   <%}else if(request.getAttribute("logininfo").equals(1)) {%>
   欢迎，${uid}<br/>
   <a href="updateuser.action" target="_top">修改信息</a>
   <a href="exit.action" target="_top">退出</a>
   <%} %>
  </body>
</html>
