<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false"%>
<<jsp:useBean id="person" class="test.Person"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <ul>
    <li><c:out value="JSTL:out的使用"></c:out></li>
    <li><c:out value="<a href='https://www.baidu.com'>百度</a>"></c:out></li>
    <li><c:out value="<a href='https//www.baidu.com'>百度</a>" escapeXml="false"></c:out></li>
    <c:out value="--------------"></c:out>
    <c:set value="1" var="name1" scope="page"></c:set>
    <c:set var="name2" scope="application">name2</c:set>
    <c:set value="xiaoqi" target="${person}" property="name"></c:set>
    <c:set    target="${person}" property="age">12</c:set>
    </ul>
    <c:remove var="name1"/>
    <c:out value="${pageScope.name1}">session</c:out>
    <c:out value="${pageScope.name2}">application</c:out>
    <c:out value="${person.name}"></c:out>
    <c:out value="${person.age}"></c:out>
    <br/>
    <c:out value="-----------------------------"></c:out>
    <br/>
  	<%pageContext.setAttribute("data1", "xiaoqi"); %>
  	<%out.println(application.getAttribute("name2")); %>
  	<%out.println(pageContext.getAttribute("name1")); %>
  	 <br/>
    <c:out value="-----------------------------"></c:out>
    <br/>
    <%
    Map map=new HashMap();
    request.setAttribute("map", map);
    %>
    <c:set value="value" property="key" target="${map}"></c:set>
    <c:set value="12" property="name" target="${map}"></c:set>
    ${map.entrySet()} 
  </body>
</html>
