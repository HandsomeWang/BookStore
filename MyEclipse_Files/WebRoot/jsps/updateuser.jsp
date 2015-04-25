<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateuser.jsp' starting page</title>
    
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
		padding: 80px;
		
		
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
		font-size: 15px;
	}
	.pwdbtn input{
		width: 100px;
		height: 30px;
		font-size: 15px;
	}
	td{
		width:200px;
	}
	.left{
	float: left;
}
.pwdbtn{
	text-align: center;
	margin-top: 20px;

}
.cancle{
	text-align: center;
	margin-top: 20px;
	font-size: 25px;
}
body{

}
	</style>
  </head>
  <script charset="UTF-8" src="/Books/jsps/js/regist.js" language="javascript"></script>
  
  <body >
  <h1 class="h1text" style="text-align: center;padding-top: 20px">A Simple BookStore——用户信息修改</h1>
 
  <div class="main">
  	 <br/>
  	<div class="left">
  	<form action="updatepwd.action" method="post">
  	<table>
  	<tr>
    			<td>请输入旧密码： </td>
    			<td><input type="password" name="oldpassword"/></td>
    		</tr>
    		<tr>
    			<td>请输入新密码：</td>
    			<td><input type="password"  name="newpassword"/></td>
    		</tr>
    		<tr>
    			<td>请再次输入新密码：</td>
    			<td><input type="password" name="renewpassword" /></td>
    		</tr>
    		
  	</table>
  	<div class="pwdbtn">
  	<input  type="submit" value="修改密码" />
  	
  	</div>
  	</form>
  	
  	</div>
  	
  	
    <form action="updateusersure.action" method="post">
    	<table align="center">
    		<tr>
    			<td>用户ID *</td>
    			<td>${useroldinfo.uid }</td>
    		</tr>
    		<tr>
    			<td>真实姓名 *</td>
    			<td><input type="text" name="u.name" id="username" value="${useroldinfo.name }" /></td>

    		</tr>
    		
    		<tr>
    			<td>身份证号码 *</td>
    			<td><input type="text" id="idcard" name="u.idcard" value="${useroldinfo.idcard }" /></td>
    		</tr>
    		<tr>
    			<td>电子邮件 *</td>
    			<td><input type="text" id="email" name="u.email" value="${useroldinfo.email }" /></td>
    		</tr>
    		<tr>
    			<td>教育程度</td>
    			<td>
    				<select name="u.edu">
    					<c:if test="${useroldinfo.edu=='大学/专科' }">
    					<option value="大学/专科" selected="selected">大学/专科</option>
    					<option value="中学">中学</option>
    					<option value="小学">小学</option>
    					</c:if>
    					<c:if test="${useroldinfo.edu=='中学' }">
    					<option value="大学/专科">大学/专科</option>
    					<option value="中学" selected="selected">中学</option>
    					<option value="小学">小学</option>
    					</c:if>
    					<c:if test="${useroldinfo.edu=='小学' }">
    					<option value="大学/专科">大学/专科</option>
    					<option value="中学">中学</option>
    					<option value="小学" selected="selected">小学</option>
    					</c:if>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>电话</td>
    			<td><input type="text" name="u.tel" value="${useroldinfo.tel }" /></td>
    		</tr>
    		<tr>
    			<td>邮政编码 *</td>
    			<td><input type="text" id="post" name="u.post" value="${useroldinfo.post }" /></td>
    		</tr>
    		<tr>
    			<td>地址 *</td>
    			<td><input type="text" id="addr" name="u.addr" value="${useroldinfo.addr }" /></td>
    		</tr>
    		<tr>
    			<td colspan="2"><div class="button"><input  type="submit" value="修改信息" /></div></td>
    			
    		</tr>
    	</table>
    	<!-- <div  >
    	<input type="submit" value="修改信息" />
    	<a href="/Books">取消</a>
    	</div> -->	
    </form>
     <div class="cancle"><a  href="/Books">返回</a></div>
    </div>
   
  </body>
</html>
