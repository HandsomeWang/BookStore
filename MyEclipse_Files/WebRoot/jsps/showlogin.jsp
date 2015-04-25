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
		margin:0;
		padding:0;
		font-family: 微软雅黑;
		font-size: 15px;
	}
	.inputtext{
		width: 110px;
		height: 20px;
	}
	.submitbtn{
		width: 80px;
		height: 23px;

		margin-left: 60px; 
		margin-top: 4px; 
	}
	.tab{
		margin-top: 4px;
	}
	</style>
  </head>
  
  <body bgcolor=#ff9900>
<% if(session.getAttribute("uid")!=null){%>
欢迎，${uid}<br/>
   <a href="updateuser.action" target="_top">修改信息</a>
   <a href="exit.action" target="_top">退出</a>
<%}else{ %>
  
    <form action="login.action" method="post">
    	<table align="center" class="tab">
    		<tr>
    			<td>用户ID:</td>
    			<td><input class="inputtext" type="text" name="u.uid" /></td>
    		</tr>
    		<tr>
    			<td>密&nbsp&nbsp&nbsp&nbsp码:</td>
    			<td><input class="inputtext" type="password" name="u.password"/></td>
    		</tr>
    		
    	</table>
    	<input class="submitbtn" type="submit" value="登陆"/>
	
    	<a href="/Books/jsps/regist.jsp" target="_top">立即注册</a>
    </form>
    <%} %>
  </body>
</html>
