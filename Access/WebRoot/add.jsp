<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加客户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- jquery是js的框架，它封装很多功能，用起来比js方便很多！ -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery.datepick.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
	
<script type="text/javascript">
	
	function add() {
		$(".error").text("");
		var bool = true;
		if(!$(":text[name=name]").val()) {
			$("#cnameError").text("客户名称不能为空");
			bool = false;
		}
		if(!$("#male").attr("checked") && !$("#female").attr("checked")) {
			$("#genderError").text("客户性别不能为空");
			bool = false;
		}
		if(!$(":text[name=phone]").val()) {
			$("#phoneError").text("手机不能为空");
			bool = false;
		}
		if(!$(":text[name=email]").val()) {
			$("#emailError").text("email不能为空");
			bool = false;
		}
		if(bool) {
			$("form").submit();
		}
	}
	
</script>
<style type="text/css">
	.error {color:red;}
</style>
  </head>
  
  <body>
<h3 align="center">添加学生</h3>
<form action="<c:url value='/UserServlet'/>" method="post">
	<!-- 向servlet传递一个名为method的参数，其值表示要调用servlet的哪一个方法 -->
	<input type="hidden" name="method" value="add"/>
<table border="0" align="center" width="40%" style="margin-left: 100px;">
	<tr>
		<td width="100px">姓名</td>
		<td width="40%">
			<input type="text" name="name"/>
		</td>
		<td align="left">
			<label id="cnameError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>性别</td>
		<td>
			<input type="radio" name="sex" value="男" id="male"/>
			<label for="male">男</label>
			<input type="radio" name="sex" value="女" id="female"/>
			<label for="female">女</label>
		</td>
		<td>
			<label id="genderError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>学号</td>
		<td>
			<input type="text" name="id" id="id" />
		</td>
		<td>
			<label id="idError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>手机</td>
		<td>
			<input type="text" name="phone"/>
		</td>
		<td>
			<label id="phoneError" class="error">&nbsp;</label>
		</td>		
	</tr>
	<tr>
		<td>邮箱</td>
		<td>
			<input type="text" name="email"/>
		</td>
		<td>
			<label id="emailError" class="error">&nbsp;</label>
		</td>	
	</tr>
	<tr>
		<td>院系</td>
		<td>
			<input type="text" name="yuanxi" id="yuanxi"/>
		</td>
		<td>
			<label id="yuanxiError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>专业</td>
		<td>
			<input type="text" name="major" id="major" />
		</td>
		<td>
			<label id="majorError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>班级</td>
		<td>
			<input type="text" name="class1" id="class1" />
		</td>
		<td>
			<label id="class1Error" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>qq</td>
		<td>
			<input type="text" name="qqNumber" id="qqNumber" />
		</td>
		<td>
			<label id="qqNumberError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>密码</td>
		<td>
			<input type="text" name="password" id="password" />
		</td>
		<td>
			<label id="passwordError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<input type="button" value="添加" onclick="add()"/>
			<input type="reset" value="重置"/>
		</td>
		<td>&nbsp;</td>
	</tr>
</table>
</form>
  </body>
</html>
