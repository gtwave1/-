<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
	<title>项目信息</title>
<link href="<c:url value="/video/video-js.min.css" />" rel="stylesheet">
<style>
body {
	background-color:cornsilk;
	background-image: url("<c:url value="/video/33.jpg" />");
	background-size: 100%;
}
.m {
	width: 100%;
	height: 60%;
	margin-left: 0;
	margin-right: 0;
	margin-top: 0;
}
</style>
</head>
<body>
<%-- <div class="m" align="center">
	<video width="800" height="500" controls>
		<source src="<c:url value="/WEB-INF/temp/20162313/abcd.mp4" />" type="video/mp4">
	</video>
	<script src="<c:url value="/video/video.min.js" />"></script>
	<script src="<c:url value="/video/zh-CN.js" />"></script>
</div> --%>

<div class="m" align="center">
    <div id="video" style="width:800px;height:500px;"></div>
  <script type="text/javascript" src="<c:url value="/video/ckplayer.min.js" />" ></script>
  <script type="text/javascript">
    var videoObject = {
        container: '#video',//“#”代表容器的ID，“.”或“”代表容器的class
        variable: 'player',//该属性必需设置，值等于下面的new chplayer()的对象
        flashplayer:false,//如果强制使用flashplayer则设置成true
        allowFullScreen:true,//是否支持全屏
        video:{
            file:'<c:url value="${id_project.video}" />',//视频地址
            type:'video/mp4'
        }
    };
    /*  */
        var player=new ckplayer(videoObject);
    
  </script> 
 </div>
<div align="center">
	<a href="<c:url value='/ProjectServlet?method=download&tid=${id_team.id}'/>"align="center">项目下载</a>
</div>
<div align="center">
	<a href="<c:url value='user/access.jsp?uid=${uid }'/>"align="center">我要评分</a>
</div>
</body>
</html>
