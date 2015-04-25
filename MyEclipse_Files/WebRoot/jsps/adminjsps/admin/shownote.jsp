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
    
    <title>My JSP 'shownote.jsp' starting page</title>
    
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
	width:650px;
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
	width:250px;
}
tr{
	height: 50px;
}
.firstline{
	font-size: 20px;
}
.tabdiv{
	text-align: center;
}
</style>
</head>

<body>
	<p class="title">—>公告管理</p>
	<hr color="green" />

	<div class="edit">
	<form action="addnote.action" method="post">
		<div class="bottom">添加新公告：<input class="msgbox" type="text" name="ncontent"/></div>
		<br/>
		<div class="btns">
		<input class="btn" type="submit" value="提交"/>
		</div>
	</form>
	</div>
	<div class="tabdiv">
	<table>
		<tr class="firstline">
			<td>管理员ID</td>
			<td class="msgtime">发布时间</td>
			<td class="context">公告内容</td>
			<td>操作</td>
		</tr>
		 <c:forEach items="${listnote}" var="allnote" varStatus="varcolor">
		  <c:if test="${varcolor.index % 2==0}">
				<tr style="background-color:#d0d0d0"></c:if>
<c:if test="${varcolor.index % 2==1}">
<tr style="background-color:#F0F0F0"></c:if>
				 <td>
				 <c:if test="${allnote.aid==aid}">
				 		<span style="color: red;font-weight: bold;">${allnote.aid}</span>
				 	</c:if>
				 	<c:if test="${allnote.aid!=aid}">
				 	${allnote.aid}
				 	</c:if>
				 </td> 
				 <td class="msgtime"><fmt:formatDate value="${allnote.ndate}" type="both"/></td> 
				 <td class="context">${allnote.ncontent}</td> 
				 <td>
				 	<c:if test="${allnote.aid==aid}">
				 		<a href="deletenote.action?nid=${allnote.nid}">删除</a>
				 	</c:if>
				 </td>
			</tr> 
		</c:forEach> 
		
	</table>
	</div>
  </body>
</html>
