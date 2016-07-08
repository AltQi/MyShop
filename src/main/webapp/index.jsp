<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 启用jstl标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 启用EL表达式 -->
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My Shop</title>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is myshop">
	<!-- easyui引入文件 -->
	<script type="text/javascript"src="<%=basePath%>jquery-easyui-1.4.4/jquery.min.js"></script>
	<script type="text/javascript"src="<%=basePath%>jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<link rel="stylesheet"href="<%=basePath%>jquery-easyui-1.4.4/themes/metro-blue/easyui.css"type="text/css"></link>
	<link rel="stylesheet"href="<%=basePath%>jquery-easyui-1.4.4/themes/icon.css" type="text/css"></link>
	
	<!-- 购物车及商品展示样式 -->
	<link rel="stylesheet"href="<%=basePath%>css/cart.css" type="text/css"></link>
	
	<link rel="stylesheet"href="<%=basePath%>css/default.css" type="text/css"></link>
	<!-- easyui扩展引入 -->
	<script type="text/javascript"src="<%=basePath%>js/Util.js"></script>
	<!-- 购物车功能引入 -->
	<script type="text/javascript"src="<%=basePath%>js/cart.js"></script>
 <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
  </head>
  
<body class="easyui-layout"  border="false">   
    <div data-options="region:'north',title:'MyShop',split:true,href:'<%=basePath%>layout/north/north.jsp'" style="height:100px;"></div>
    <!-- 南部面板不要    -->
    <!-- <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>  -->  
    <div data-options="region:'east',iconCls:'icon-reload',title:'猜您喜欢',split:true,href:'<%=basePath%>layout/east/east.jsp'" style="width:200px;"></div>   
    <div data-options="region:'west',title:'导航',split:true,href:'<%=basePath%>layout/west/west.jsp'" style="width:150px;"></div>   
    <div data-options="noheader:true,region:'center',title:'商品',href:'<%=basePath%>layout/center/center.jsp'" ></div>
    <!-- 登录及注册 -->
 	<jsp:include page="user/login.jsp"></jsp:include>
	<jsp:include page="user/reg.jsp"></jsp:include>    
</body> 
</html>
