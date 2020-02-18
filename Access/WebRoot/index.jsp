<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#3f51b5">
	<title>考试报名系统</title>
	<!-- css -->
	<link href="../css/base.min_2.css" rel="stylesheet">
	<link href="../css/project.min_2.css" rel="stylesheet">
	<link href="../css/846dc5f5a0e74a049bccf7c5e3323609.css" rel="stylesheet">
	<link href="../css/a37f31ccfd974190b89df381ccad2709.css" rel="stylesheet">

	<!-- favicon -->

	<!-- ... -->
</head>
  <style>
.divcss5{ position:fixed; bottom:0;}
</style>
<body class="page-brand">
	<header class="header header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">format_align_justify</span>
				</a>
			</li>
		</ul>

		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
									<span class="access-hide">未登录</span>
             			 <span class="icon icon-cd margin-right">account_circle</span>
				<!--	<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="picture/avatar-001_1.jpg"></span> -->
					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li>
							<a class="padding-right-lg waves-attach" href="/auth/login"><span class="icon icon-lg margin-right">vpn_key</span>登录</a>
						</li>
						<li>
							<a class="padding-right-lg waves-attach" href="/auth/register"><span class="icon icon-lg margin-right">person_add</span>注册</a>
						</li>
					</ul>
				
			</li>
		</ul>
	</header>
	<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<a class="menu-logo" href="/"><i class="icon icon-lg">language</i>&nbsp;点击返回首页</a>
			</div>
		</div>
	</nav>


<main class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
                <section class="content-inner">

                    <nav class="tab-nav margin-top-no">
                        <ul class="nav nav-justified">
                            <li class="active">
                                <a class="waves-attach" data-toggle="tab" href="#passwd_login">密码登录</a>
                            </li>
                                                    </ul>
                    </nav>
                    <div class="card-inner">
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="passwd_login">
                                <div class="card">
                                    <div class="card-main">
                                        <div class="card-header">
                                            <div class="card-inner">
                                                <h1 class="card-heading" style=" text-align:center;font-weight:bold;">
                                                    登录到用户中心</h1>
                                            </div>
                                        </div>
                                        <div class="card-inner">
                                          <h3 align="center">参赛列表</h3>
<table border="1" width="70%" align="center">
	<tr>
		<th>姓名</th>
		<th>学号</th>
		<th>比赛类型</th>
		<th>邮箱</th>
		<th>分数</th>
	</tr>
<%--
要遍历提PageBean的beanList这个集合
 --%>
<c:forEach items="${pb.beanList}" var="cstm">
	<tr>
		<td>${cstm.name }</td>
		<td>${cstm.id }</td>
		<td>${cstm.jobb }</td>
		<td>${cstm.email }</td>
		<td>${cstm.score }</td>
		<td>
			<a href="<c:url value='/CompetitorServlet?method=preEdit&cid=${cstm.id }'/>">编辑</a>
			<a href="<c:url value='/msg.jsp'/>">删除</a>
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
                                        </div>
                                    </div>
                                </div>
                            </div>

                                                    </div>
                    </div>

                    <div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint" id="msg"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" type="button" id="result_ok">知道了</button></p>
			</div>
		</div>
	</div>
</div>

                </section>
            </div>
        </div>
    </div>
</main>

	<footer class="ui-footer">
		<div class="container">
			<marquee>&copy; 零点工作室  <a href="/staff"></a><amarquee>		</div>
	</footer>




	<!-- js -->
	<script src="../js/jquery.min_2.js"></script>
	<script src="../js/gt_2.js"></script>

	<script src="../js/base.min_2.js"></script>
	<script src="../js/project.min_2.js"></script>
	<script type="text/javascript" color="217,113,24" opacity="0.8" count="99" src="../js/canvas-nest.js@1.0_2.js"></script>
</body>
</html>

<script>
    $(document).ready(function () {
        function login() {
            
            document.getElementById("login").disabled = true;

            $.ajax({
                type: "POST",
                url: "/auth/login",
                dataType: "json",
                data: {
                    email: $("#email").val(),
                    passwd: $("#passwd").val(),
                    code: $("#code").val(),
                    remember_me: $("#remember_me:checked").val()                },
                success: function (data) {
                    if (data.ret == 1) {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/user'", 1200);
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        document.getElementById("login").disabled = false;
                                            }
                },
                error: function (jqXHR) {
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误：" + jqXHR.status);
                    document.getElementById("login").disabled = false;
                                    }
            });
        }

        $("html").keydown(function (event) {
            if (event.keyCode == 13) {
                login();
            }
        });
        $("#login").click(function () {
            login();
        });

        $('div.modal').on('shown.bs.modal', function () {
            $("div.gt_slider_knob").hide();
        });

        $('div.modal').on('hidden.bs.modal', function () {
            $("div.gt_slider_knob").show();
        });
    })
</script>



<?php
$a=$_POST['Email'];
$b=$_POST['Password'];
?>