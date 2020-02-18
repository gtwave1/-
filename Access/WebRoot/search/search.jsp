<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>高级搜索</title>

<link rel="stylesheet" type="text/css" href="css/styles.css">
<style type="text/css">
body,td,th { font-family: "Source Sans Pro", sans-serif; }
body { background-color: #2B2B2B; }
</style>
</head>
<body>


<div class="wrapper">

	<div class="container">
		<h1>Search</h1>
		<form class="form" action="<c:url value='/UserServlet'/>" method="get">
			<input type="text" name="name" placeholder="Username">
			<select name="sex" style="text-align: center; text-align-last: center; font-family: 'Source Sans Pro', sans-serif;">
			    <option value=""  disabled selected hidden style="text-align: center; ">Sex</option>
				<option value="男"  style="text-align: center;  text-align-last: center">男</option>
				<option value="女"  style="text-align: center;  text-align-last: center">女</option>
			</select>
			<input type="text" name="phone" placeholder="Phone">
			<input type="text" name="email" placeholder="E-mail">
			<button type="submit" id="login-button">Search</button>
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	
</div>

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
$('#login-button').click(function(event){
	event.preventDefault();
	$('form').fadeOut(500);
	$('.wrapper').addClass('form-success');
});
</script>

</body>
</html>