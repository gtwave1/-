<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>找回密码</title>
<link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Reset Password Form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!--google fonts-->
</head>
<body>
<!--element start here-->
<div class="elelment">
	<h2>重新设置你的密码</h2>
	<div class="element-main">
		<h1>忘记密码</h1>
		<p> 请根据你的邮箱收到的验证码进行密码找回</p>
		<form>
			<input type="text" placeholder="邮箱" name="email">
			<input type="text" class="code" placeholder="验证码" name="verify"><button class="getcode">获取验证码</button>
			<input type="password" placeholder="密码" name="keywords">
			<input type="submit" value="Reset my Password">
		</form>
	</div>
</div>
<div class="copy-right">
			<p>江西农业大学 <a href="http://www.jxau.edu.cn/" target="_blank">软件学院 </a></p>
</div>

<!--element end here-->
</body>
</html>