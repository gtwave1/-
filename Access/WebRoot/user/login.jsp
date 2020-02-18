<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="<c:url value='/css/base.min_2.css' />" rel="stylesheet">
    <link href="<c:url value='/css/project.min_2.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/846dc5f5a0e74a049bccf7c5e3323609.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/a37f31ccfd974190b89df381ccad2709.css'/>" rel="stylesheet">
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
                   
        <!--  <span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="picture/avatar-001_1.jpg"></span> -->
          </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li>
                        <a class="padding-right-lg waves-attach" href="<c:url value='/user/login.jsp'/>"><span class="icon icon-lg margin-right">vpn_key</span>登录</a>
                    </li>
                    <li>
                        <a class="padding-right-lg waves-attach" href="<c:url value='/register.jsp'/>"><span class="icon icon-lg margin-right">person_add</span>注册</a>
                    </li>
                </ul>
            </li>
        </ul>
    </header>
    <nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
        <div class="menu-scroll">
            <div class="menu-content">
                <a class="menu-logo" href="<c:url value='/welcome.jsp'/>">点击返回首页</a>
                <ul class="nav">
                    <li>
                        <a  href="login.jsp">登录</a>
                    </li>
                    <li>
                        <a  href="<c:url value='/register.jsp'/>">注册</a>
                    </li>
                </ul>
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
                                                <form action="<c:url value= '/UserServlet'/>" method="post">
                                                <input type="hidden" name="method" value="login" />
                                                <div class="form-group form-group-label">
                                                        <div class="row">
                                                            <div class="col-md-10 col-md-push-1">
                                                                <p style="color: red; font-weight: 900">${msg }</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-label">
                                                        <div class="row">
                                                            <div class="col-md-10 col-md-push-1">
                                                                <label class="floating-label" for="email">学号</label>
                                                                <input class="form-control" id="id" type="text" name="id" value="${user.id }">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-label">
                                                        <div class="row">
                                                            <div class="col-md-10 col-md-push-1">
                                                                <label class="floating-label" for="passwd">密码</label>
                                                                <input class="form-control" id="passwd" type="password" name="password">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-label">
                                                        <div class="row">
                                                            <div class="col-md-10 col-md-push-1">
                                                                <a href="../forget.jsp" >忘记密码？点击这里</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-10 col-md-push-1">
                                                                <button id="login" type="submit" class="btn btn-block btn-brand waves-attach waves-light">
                                                                    登录
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                       
                                                </form>
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
            <marquee>&copy; 零点工作室 <a href="/staff"></a>
                <amarquee>
        </div>
    </footer>
    <!-- js -->
    <script src="<c:url value='/js/jquery.min_2.js' />"></script>
    <script src="<c:url value='/js/gt_2.js' />"></script>
    <script src="<c:url value='/js/base.min_2.js' />"></script>
    <script src="<c:url value='/js/project.min_2.js' />"></script>
    <script type="text/javascript" color="217,113,24" opacity="0.8" count="99" src="<c:url value='/js/canvas-nest.js@1.0_2.js' />"></script>
</body>

</html>