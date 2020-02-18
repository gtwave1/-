<%@page import="java.net.CookieStore"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
    <title>在线评分</title>
    <!-- custom-theme -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Elegant Feedback Form  Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript">
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

    function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <!-- //custom-theme -->
    <link href="../css/style1.css" rel="stylesheet" type="text/css" media="all" />
    <link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
</head>
<% 
	String id = request.getParameter("id");
	session.setAttribute("uid", id);
	
%>
<body class="agileits_w3layouts">
    <h1 class="agile_head text-center">评委评分</h1>
    <div class="w3layouts_main wrap">
        <h3>请看完选手视频和文档做出合理评价 </h3>
        <form action="<c:url value = '/TeamServlet?method=mark&uid=${uid }'/>" method="post" class="agile_form">
            <h2>您对这个项目的满意度怎么样？</h2>
            <ul class="agile_info_select">
                <li><input type="radio" id="excellent" name="fell">
                    <label for="excellent">excellent</label>
                    <div class="check w3"></div>
                </li>
                <li><input type="radio"  id="good" name="fell">
                    <label for="good"> good</label>
                    <div class="check w3ls"></div>
                </li>
                <li><input type="radio"  id="neutral" name="fell">
                    <label for="neutral">neutral</label>
                    <div class="check wthree"></div>
                </li>
                <li><input type="radio" id="poor" name="fell">
                    <label for="poor">poor</label>
                    <div class="check w3_agileits"></div>
                </li>
            </ul>
            <h2>
        <textarea   class="w3l_summary" placeholder="写下你的评价及评分理由"></textarea>
        </h2>
            <input type="text" placeholder="最后得分" name="score" required /><br/>
            <input type="submit" value="提交" class="agileinfo" />
            <input type="submit" id="back" value="返回" class="agileinfo" onclick="javascript:reback(); return false;" />
        </form>
</body>
<script type="text/javascript">
	function reback() {
		window.location.href="<c:url value='/TeamServlet?method=findAll'/>";
	}
</script>

</html>