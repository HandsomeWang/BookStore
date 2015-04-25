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
 body{
	margin: 0;
	padding: 0;
} 
	*{
		font-family: 微软雅黑;
	}
	ul {
	margin-top: 25px;
	margin-left: 13px;
	margin-right: 0;
	list-style-type: none;

	}

	.lidiv{
		margin: 0;
		padding-top: 7px;
		padding-bottom: 7px;
		
		text-align:center;
		color: #ffffff;
	}
	a{
		font-size:16px;
		font-weight:bold;
		text-transform:none;
		text-decoration:none;
		color: #ffffff;
	} 
	a:HOVER {
	text-decoration:underline;
}
/* .bottom{
	width:100%;
	height:100%;
	background: #007500;
} */
.notetitle{
	margin-left: 12px;
	height:30px;
	background: #007500;
	font-size:18px;
		font-weight:bold;
}
.title_p{
	color: white;
	font-style: italic;
}
.ncontent{
	margin-left: 13px;
	 line-height:20px;
	 color: white;
	 height: 150px;
}
	</style>
  </head>
  
  <body bgcolor=#009100>
    <ul>
    <c:forEach items="${listtype1}" var="ltype" varStatus="varcolor">	
    
   <c:if test="${varcolor.index % 2==0}">
				<li style="background-color:#007500"></c:if>
<c:if test="${varcolor.index % 2==1}">
<li style="background-color:#009100"></c:if>

<div class="lidiv">
    <a href="/Books/type.action?typeid=${ltype.tid}&pc=1" target="body">${ltype.tname}</a>
    </div>
    </li>
    </c:forEach>
    </ul>
     <div class="notetitle">
     	<p class="title_p">——— 最新公告 ———</p>
     </div>
     <div >
     <marquee direction="up" scrollamount="4" scrolldelay="0" class="ncontent" onmouseover=stop() onmouseout=start() >${lastnote.ncontent}</marquee>
     
     </div>
  </body>
</html>
