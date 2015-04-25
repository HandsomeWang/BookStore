<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'main.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

*{font-size:10pt;padding: 0px; margin: 0px;}
body{text-align:center;}
.table{height:100%;border:1px solid #15B69A;border-collapse: collapse;}

.trTop {text-align: center; height: 120px;}
.body{height: 750px;}

iframe {width: 100%;height: 100% ;}

</style>
</head>

<body>
	<br>
	<table>
		<tr class="trTop">
		<td width="1200px">
			<iframe frameBorder=0
				src="jsps/adminjsps/admin/top.jsp" name="top"></iframe>
				</td>
		</tr>
		<tr class="body">
		<td width="1200px">
			<iframe scrolling="auto" frameBorder=0 src="jsps/adminjsps/admin/body1.jsp" name="body1"></iframe>
			</td>
		</tr>
	</table>
</body>
</html>
