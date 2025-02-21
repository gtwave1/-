<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
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
<h3 align="center">参赛列表</h3>
<table border="1" width="70%" align="center">
	<tr>
		<th>组长</th>
		<th>组员1</th>
		<th>组员2</th>
		<th>组员3</th>
		<th>组员4</th>
		<th>比赛结果</th>
		<th>参赛类别</th>
		<th>参赛组别</th>
		<th>分数</th>
	</tr>
<%--
要遍历提PageBean的beanList这个集合
 --%>
<c:forEach items="${pb.beanList}" var="cstm">
	<tr>
		<td>${cstm.fid }</td>
		<td>${cstm.sid }</td>
		<td>${cstm.tid }</td>
		<td>${cstm.foid }</td>
		<td>${cstm.fiid }</td>
		<td>${cstm.result }</td>
		<td>${cstm.category }</td>
		<td>${cstm.kind }</td>
		<td>${cstm.score }</td>
		<td>
			<a href="<c:url value='/user/access.jsp?id=${cstm.id }'/>">评分</a>
			<a href="<c:url value='/ProjectServlet?method=find&id=${cstm.fid }'/>">视频</a>
		</td>
	</tr>
</c:forEach>
</table>
<br/>
<%-- 
给出分页相差的链接
 --%>
<center>
第${pb.pc }页/共${pb.tp }页

<a href="${pb.url }&pc=1">首页</a>
<c:if test="${pb.pc > 1 }">
<a href="${pb.url }&pc=${pb.pc-1}">上一页</a>
</c:if>

<%-- 计算begin、end --%>
<c:choose>
	<%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
	<c:when test="${pb.tp <= 10 }">
		<c:set var="begin" value="1" />
		<c:set var="end" value="${pb.tp }" />
	</c:when>
	<c:otherwise>
		<%-- 当总页数>10时，通过公式计算出begin和end --%>
		<c:set var="begin" value="${pb.pc-5 }" />
		<c:set var="end" value="${pb.pc+4 }" />	
		<%-- 头溢出 --%>
		<c:if test="${begin < 1 }">
			<c:set var="begin" value="1" />
			<c:set var="end" value="10" />
		</c:if>	
		<%-- 尾溢出 --%>
		<c:if test="${end > pb.tp }">
			<c:set var="begin" value="${pb.tp - 9 }" />
			<c:set var="end" value="${pb.tp }" />
		</c:if>	
	</c:otherwise>
</c:choose>
<%-- 循环遍历页码列表 --%>
<c:forEach var="i" begin="${begin }" end="${end }">
	<c:choose>
		<c:when test="${i eq pb.pc }">
			[${i }]
		</c:when>
		<c:otherwise>
			<a href="${pb.url }&pc=${i}">[${i }]</a>	
		</c:otherwise>
	</c:choose>
	
</c:forEach>


<c:if test="${pb.pc < pb.tp }">
<a href="${pb.url }&pc=${pb.pc+1}">下一页</a>
</c:if>
<a href="${pb.url }&pc=${pb.tp}">尾页</a>
</center>
  </body>
</html>
