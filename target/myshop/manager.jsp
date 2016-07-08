<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
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

<title>首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
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
<script type="text/javascript"src="<%=basePath%>js/date.js"></script>
</head>
  

<body class="easyui-layout" >
 	<div data-options="region:'north',href:'${pageContext.request.contextPath}/layout/north.jsp'" style="height: 30px;overflow: hidden;" ></div>
 	<div data-options="region:'west',title:'后台管理',href:'${pageContext.request.contextPath}/layout/west.jsp'" style="width:300px;overflow: hidden;"></div>
	<div data-options="region:'center',href:'${pageContext.request.contextPath}/layout/center.jsp'" style="overflow: hidden;"></div>
	<div data-options="region:'east',title:'日历',split:true" style="width: 200px;overflow: hidden;">
		<jsp:include page="layout/east.jsp"></jsp:include>
	</div>
	<div data-options="region:'south',href:'${pageContext.request.contextPath}/layout/south.jsp'" style="height: 27px;overflow: hidden;"></div>
</body>
</html>
