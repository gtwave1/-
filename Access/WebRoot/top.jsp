<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<!-- 它的作用是为本页面所有的表单和超链接指定显示内容的框架！ -->
    <base target="main">
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="text-align: center;">
  	<h1>管理员中心</h1>
    <a href="<c:url value='/add.jsp'/>">添加用户</a> 　|　
    <a href="<c:url value='/UserServlet?method=findAll'/>">查询用户</a>  |
    　 <a href="<c:url value='/TeamServlet?method=findAll2'/>">查询队伍</a>　 |
    <a href="<c:url value='/search/search.jsp'/>">高级搜索</a>　　
  </body>
</html>