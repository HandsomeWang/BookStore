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
	a{
		text-transform:none;
		text-decoration:none;
	
	} 
	a:HOVER {
	text-decoration:underline;
}
.title {
	color: green;
	font-size: 25px;
	text-align: left;
}
table{
	text-align: center;
}
tr{
	height: 40px;
}
td{
	width: 200px;
}
	</style>
  </head>
  
  <body>
  <p class="title">分类管理</p>
	<hr color="green" />
	 <form action="addtype.action" method="post">
	添加新的分类名称：<input type="text" name="newtypename"/><input type="submit" value="确定添加"/>
	</form>
	

  <table>
  	<tr>
  		<td>类型名称</td>
  		<td>操作</td>
  	</tr>
  	<c:forEach items="${listtype1}" var="ltype" varStatus="varcolor">
		  <c:if test="${varcolor.index % 2==0}">
				<tr style="background-color:#d0d0d0"></c:if>
<c:if test="${varcolor.index % 2==1}">
<tr style="background-color:#F0F0F0"></c:if>
  		<td>${ltype.tname}</td>
  		<td>
  		 <a href="javascript:if(confirm('确实要删除该分类吗?'))location='deletetype.action?tid=${ltype.tid}'">删除</a>
  <%-- 			<a href="deletetype.action?tid=${ltype.tid}">删除</a> --%>
  			<a href="itemtype.action?tid=${ltype.tid}">编辑</a>
  		</td>
  	</tr>
  	</c:forEach>
  </table>
  <a href="jsps/adminjsps/admin/body1.jsp">返回</a>
 
  </body>
</html>
