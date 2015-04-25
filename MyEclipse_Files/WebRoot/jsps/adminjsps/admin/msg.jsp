<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'msg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
* {
	font-family: 微软雅黑;
}

.title {
	color: green;
	font-size: 25px;
	text-align: left;
}
table{
	text-align: center;
}
td{
	width: 100px;
}

.top{
	padding-left: 55px;
	padding-top: 20px;
}
.bottom{
	padding-left: 13px;
	vertical-align:middle;
	line-height: 80px;
}
.context{
	width:500px;
}
.msgtime{
	width:250px;
}
tr{
	height: 50px;
}
.firstline{
	font-size: 20px;
}
.userid{
	color: red;
}
</style>
  </head>
  
  <body>
  <p class="title">—>留言</p>
	<hr color="green" />
    <table>
		<tr class="firstline">
			<td>留言ID</td>
			<td>用户ID</td>
			<td>留言人</td>
			<!-- <td>电子邮件</td> -->
			<td>主题</td>
			<td class="msgtime">留言时间</td>
			<td class="context">留言内容</td>
			<td>操作</td>
		</tr>
		 <c:forEach items="${msglist}" var="allmsg" varStatus="varcolor">
		  <c:if test="${varcolor.index % 2==0}">
				<tr style="background-color:#d0d0d0"></c:if>
<c:if test="${varcolor.index % 2==1}">
<tr style="background-color:#F0F0F0"></c:if>
				 <td>${allmsg.mid}</td> 
				 <td class="userid">${allmsg.uid}</td> 
				 <td>${allmsg.name}</td> 
			<%-- 	 <td>${allmsg.email}</td> --%>
				<td>${allmsg.theme}</td> 
				 <td class="msgtime"><fmt:formatDate value="${allmsg.date}" type="both"/></td> 
				 <td class="context">${allmsg.context}</td> 
				 <td><a href="javascript:if(confirm('确实要删除该留言吗?'))location='deletemsg.action?mid=${allmsg.mid}'">删除</a></td>
 
<%-- 				 <td><a href="deletemsg.action?mid=${allmsg.mid}">删除</a></td>  --%>
			</tr> 
		</c:forEach> 
		
	</table>
  </body>
</html>
