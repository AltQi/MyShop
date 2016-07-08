<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>MyShop</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<!-- 引入easyui -->
	<script type="text/javascript"  src="<%=basePath%>jquery-easyui-1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="<%=basePath%>jquery-easyui-1.4.4/themes/default/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=basePath%>jquery-easyui-1.4.4/themes/icon.css" type="text/css"></link>
	<!-- easyui引用完毕 -->
  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
