<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regist.jsp' starting page</title>
    
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
		margin: 0px;
	}
	.h1text {
		background: #15B69A;
		margin: 0px;
		color: #ffffff;
	}
	.main{
		background:  #15B69A ;
		padding: 30px;
		
	}
	table input{
		width: 200px;
	}
	.button{
		 text-align:center;
		 margin: 20px;
	}
	.button input{
		width: 100px;
		height: 30px;
		font-size: 15px;;
	}
	td{
		width:200px;
	}
	</style>
  </head>
  <script charset="UTF-8" src="/Books/jsps/js/regist.js" language="javascript"></script>
  
  <body >
  <h1 class="h1text" style="text-align: center;padding-top: 20px">A Simple BookStore</h1>
  <div class="main">
  	<h2 align="center">新用户注册</h2>
    <form action="registaction.action" method="post">
    	<table align="center">
    		<tr>
    			<td>用户ID *</td>
    			<td><input type="text" name="u.uid" id="uid" onblur="checkUid()"/></td>
    			<td ><span id="sp0"></span></td>
    		</tr>
    		<tr>
    			<td>真实姓名 *</td>
    			<td><input type="text" name="u.name" id="username" onblur="checkUsername()" /></td>
    			<td ><span id="sp1"></span></td>
    		</tr>
    		<tr>
    			<td>密码 *</td>
    			<td><input type="password" id="psd" name="u.password" onblur="checkPsd()"/></td>
    			<td ><span id="sp2"></span></td>
    		</tr>
    		<tr>
    			<td>确认密码 *</td>
    			<td><input type="password" id="psd1" name="repassword" onblur="checkPsd1()"/></td>
    			<td><span id="sp3"></span></td>
    		</tr>
    		<tr>
    			<td>身份证号码 *</td>
    			<td><input type="text" id="idcard" name="u.idcard" onblur="checkIdcard()"/></td>
    			<td ><span id="sp4"></span></td>
    		</tr>
    		<tr>
    			<td>电子邮件 *</td>
    			<td><input type="text" id="email" name="u.email" onblur="checkEmail()"/></td>
    			<td ><span id="sp5"></span></td>
    		</tr>
    		<tr>
    			<td>教育程度</td>
    			<td>
    				<select name="u.edu">
    					<option value="大学/专科">大学/专科</option>
    					<option value="中学">中学</option>
    					<option value="小学">小学</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>电话</td>
    			<td><input type="text" name="u.tel"/></td>
    		</tr>
    		<tr>
    			<td>邮政编码 *</td>
    			<td><input type="text" id="post" name="u.post" onblur="checkPost()"/></td>
    			<td ><span id="sp6"></span></td>
    		</tr>
    		<tr>
    			<td>地址 *</td>
    			<td><input type="text" id="addr" name="u.addr" onblur="checkAddr()"/></td>
    			<td ><span id="sp7"></span></td>
    		</tr>
    	</table>
    	<div class="button" >
    	<input type="submit" value="注册" />
    	<a href="/Books">取消</a>
    	</div>	
    </form>
    </div>
  </body>
</html>
