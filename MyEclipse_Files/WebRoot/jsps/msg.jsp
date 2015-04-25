<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

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
.context{
	width:450px;
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
.inputs{
	width: 182px;
}
.msgbox{
	width: 700px;
	height:80px;
	margin: 10px;
}
.btn{
	width:70px;
}
.btns{
	text-align: center;
}
.edit{
	background: #FFBB77;
}
.msgtime{
	width:200px;
}
tr{
	height: 50px;
}
.firstline{
	font-size: 20px;
}
</style>
</head>

<body>
	<p class="title">—>留言</p>
	<hr color="green" />
	<% if(session.getAttribute("uid")==null){%>
	您还没有登录，请先登录。<a href="listhotbooksdetail.action">返回主页</a>
	<%}else{ %>
	<div class="edit">
	<form action="addmsg.action" method="post">
	<div class="top">
	<!-- 	姓名：<input class="inputs" type="text" name="m.name"/>* -->
		主题：<input class="inputs" type="text" name="m.theme"/>
	<!-- 	电子邮件：<input class="inputs" type="text" name="m.email"/> -->
		</div>
		<br/>
		<div class="bottom">你的留言：<input class="msgbox" type="text" name="m.context"/></div>
		<br/>
		<div class="btns">
		<input class="btn" type="submit" value="提交"/>
		</div>
	</form>
	</div>
	<table>
		<tr class="firstline">
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
				 <td>${allmsg.name}</td> 
			<%-- 	 <td>${allmsg.email}</td> --%>
				<td>${allmsg.theme}</td> 
				 <td class="msgtime"><fmt:formatDate value="${allmsg.date}" type="both"/></td> 
				 <td class="context">${allmsg.context}</td> 
				 <td>
				 	<c:if test="${allmsg.uid==uid}">
				 		<a href="javascript:if(confirm('确实要删除该留言吗?'))location='userdeletemsg.action?mid=${allmsg.mid}'">删除</a>
				 		
				 	</c:if>
				 </td>
			</tr> 
		</c:forEach> 
		
	</table>
	<%} %>
</body>
</html>
