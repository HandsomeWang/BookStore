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
	table {
		margin-top: 0;
		margin-left: 150px;
		
	}
	.tdtext{
		color: white;
		font-size: 20px;
		padding-right: 50px;
		font-weight: bold;
	}
	.select{
		width:150px;
	}
	.tdstyle{
		height:10px;
	}
	.keyword{
		width:230px;
	}
	.btn{
		width:72px;
	}
	}
</style>
  </head>
  
  <body bgcolor=#999999>
     <form action="userselect.action?pc=1" method="post" target="body">
    	<table>
    		<tr>
    			<td class="tdtext" rowspan="2">检索关键字</span></td>
    			<td class="tdstyle">
    				<select class="select" name="field">
    					<option value="书名">书名</option>
    					<option value="作者">作者</option>
    					<option value="出版社">出版社</option>
    					<option value="检索方式" selected="selected">检索方式</option>
    				</select>
    				<select class="select" name="type">
    					<c:forEach items="${listtype}" var="ltype">	
    					<option value="${ltype.tid}">${ltype.tname}</option>
    					</c:forEach>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<input class="keyword" type="text" name="condition"/>
    				<input class="btn" type="submit" value="检索"/>
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
