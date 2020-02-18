<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class="full-height" lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
    <meta name="theme-color" content="#3f51b5">
    <title>江农软件学院</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/material-dash.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/600c4de587ec4d649ffc60ae69197b3a.css" rel="stylesheet">
    <link href="css/mdb.css" rel="stylesheet">
    <link rel="stylesheet" href="css/fakeloader.css">
    <link rel="shortcut icon" href="favicon.ico" />
    <link rel="bookmark" href="favicon.ico" />
</head>
<style>
    @import url(css/font-awesome.min.css);

    @font-face {
        font-family: title-speed;
        src: url('/fonts/LobsterTwo-Regular.otf');
    }

    .navbar-brand {
        font-family: title-speed;
        font-size: 1.2rem;
        font-weight: 500;

    }

    body {
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #212529;
        text-align: left;
        background-color: #fff;

    }

    #intro {
        background: url("images/9.8.1.jpg") no-repeat center center;
        background-size: cover;
    }

    #intro .h6 {
        font-weight: 300;
        line-height: 1.7;
    }

    .hm-gradient .full-bg-img {
        background: rgba(42, 27, 161, 0.7);
        background: linear-gradient(45deg, rgba(42, 27, 161, 0.7), rgba(29, 210, 177, 0.7) 100%);
    }

    @media (max-width: 450px) {
        .margins {
            margin-right: 1rem;
            margin-left: 1rem;
        }
    }

    #pricing .lead {
        opacity: 0.7;
    }

    #pricing .card-image {
        background: url("images/9.8.1.jpg") no-repeat center center;
    }

    #pricing ul li {
        font-size: 1.1em;
    }

    .text-white {
        color: #fff !important;
    }

    .row {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        margin-right: -15px;
        margin-left: -15px;
    }

    .align-items-center {
        -webkit-box-align: center !important;
        -ms-flex-align: center !important;
        align-items: center !important;
    }

    .d-flex {
        display: -webkit-box !important;
        display: -ms-flexbox !important;
        display: flex !important;
    }

    @media (min-width: 992px) {
        .col-lg-6 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 50%;
            flex: 0 0 50%;
            max-width: 50%;
        }

        .col-lg-4 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 33.333333%;
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
        }
    }

    @media (min-width: 1200px) {
        .col-xl-5 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 41.666667%;
            flex: 0 0 41.666667%;
            max-width: 41.666667%;
        }

        .col-xl-7 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 58.333333%;
            flex: 0 0 58.333333%;
            max-width: 58.333333%;
        }

        .pr-lg-5, .px-lg-5 {
            padding-right: 3rem !important;
        }

    }

    .col-1 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 8.333333%;
        flex: 0 0 8.333333%;
        max-width: 8.333333%;
        padding-right: 15px;
        padding-left: 15px;
    }

    .col-10 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 83.333333%;
        flex: 0 0 83.333333%;
        max-width: 83.333333%;
        padding-right: 15px;
        padding-left: 15px;
    }

    .col-md-12 {
        position: relative;
        width: 100%;
        min-height: 1px;
        padding-right: 15px;
        padding-left: 15px;
    }

    }

    .lead {
        font-size: 1.25rem;
        font-weight: 300;
    }

    .h1 {
        font-size: 2.5rem;
    }

    .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
        margin-bottom: .5rem;
        font-family: inherit;
        font-weight: 500;
        line-height: 1.2;
        color: inherit;
    }

    h1, h2, h3, h4, h5, h6 {
        margin-top: 0;
        margin-bottom: .5rem;
    }

    .h5, h5 {
        font-size: 1.25rem;
    }

    p {
        margin-top: 0;
        margin-bottom: 1rem;
    }

    .card-body {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        padding: 1.25rem;
    }

    sup {
        top: -.5em;
    }

    sub, sup {
        position: relative;
        font-size: 75%;
        line-height: 0;
        vertical-align: baseline;
    }

    .rounded {
        border-radius: .25rem !important;
    }

    .img-fluid {
        max-width: 100%;
        height: auto;
    }

    img {
        vertical-align: middle;
        border-style: none;
    }

    .no-gutters {
        margin-right: 0px;
        margin-left: 0px;
    }

    @font-face {
        font-family: anticon;
        src: url("https://at.alicdn.com/t/font_zck90zmlh7hf47vi.eot");
        src: url("https://at.alicdn.com/t/font_zck90zmlh7hf47vi.eot?#iefix") format("embedded-opentype"), url("https://at.alicdn.com/t/font_zck90zmlh7hf47vi.woff") format("woff"), url("https://at.alicdn.com/t/font_zck90zmlh7hf47vi.ttf") format("truetype"), url("https://at.alicdn.com/t/font_zck90zmlh7hf47vi.svg#iconfont") format("svg")
    }

    .anticon-down::before {
        content: "\E61D";
    }

    .anticon::before {
        display: block;
        font-family: anticon !important;
    }

    .anticon {
        display: inline-block;
        font-style: normal;
        vertical-align: baseline;
        text-align: center;
        text-transform: none;
        line-height: 1;
        text-rendering: optimizeLegibility;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    .banner0-icon {
        bottom: 20px;
        font-size: 24px;
        position: absolute;
        left: 50%;
        margin-left: -12px;
        color: #fff;
    }

    @-moz-keyframes bounce {
        0%, 20%, 50%, 80%, 100% {
            -moz-transform: translateY(0);
            transform: translateY(0);
        }
        40% {
            -moz-transform: translateY(-30px);
            transform: translateY(-30px);
        }
        60% {
            -moz-transform: translateY(-15px);
            transform: translateY(-15px);
        }
    }

    @-webkit-keyframes bounce {
        0%, 20%, 50%, 80%, 100% {
            -webkit-transform: translateY(0);
            transform: translateY(0);
        }
        40% {
            -webkit-transform: translateY(-30px);
            transform: translateY(-30px);
        }
        60% {
            -webkit-transform: translateY(-15px);
            transform: translateY(-15px);
        }
    }

    @keyframes bounce {
        0%, 20%, 50%, 80%, 100% {
            -moz-transform: translateY(0);
            -ms-transform: translateY(0);
            -webkit-transform: translateY(0);
            transform: translateY(0);
        }
        40% {
            -moz-transform: translateY(-30px);
            -ms-transform: translateY(-30px);
            -webkit-transform: translateY(-30px);
            transform: translateY(-30px);
        }
        60% {
            -moz-transform: translateY(-15px);
            -ms-transform: translateY(-15px);
            -webkit-transform: translateY(-15px);
            transform: translateY(-15px);
        }
    }

    .bounce {
        -moz-animation: bounce 3s infinite;
        -webkit-animation: bounce 3s infinite;
        animation: bounce 3s infinite;
    }
</style>

<body id="top" class="off-canvas-sidebar">
    <div class="fakeloader"></div>
    <header>
        <!-- Navbar-->
        <nav class="navbar navbar-primary navbar-transparent navbar-absolute">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand  animated swing" href="welcome.jsp">软件学院</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active">
                            <a href="welcome.jsp">
                            首页
                        </a>
                        </li>
                        <c:choose>
                            <c:when test="${not empty sessionUser}">
                                <li>
                                    <a href="user/userProfile.jsp">${sessionUser.name}，你好！</a>
                                </li>
                            </c:when>
                            <c:when test="${not empty sessionZeroPoint}">
                                <li>
                                    <a href="user/zeroPoint.jsp">${sessionZeroPoint.name}，你好！</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="user/login.jsp">登录</a>
                                </li>
                                <li>
                                    <a href="register.jsp">注册</a>
                                </li>
                                <li>
                                    <a href="forget.jsp">找回密码</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Intro Section-->
        <section class="view hm-gradient" id="intro">
            <div class="full-bg-img d-flex align-items-center">
                <div class="container">
                    <div class="row no-gutters">
                        <div class="col-md-10 col-lg-6 text-center text-md-left margins">
                            <div class="white-text">
                                <div class="wow fadeInLeft" data-wow-delay="0.3s">
                                    <h1 class="h1-responsive font-bold mt-sm-5" >Hello World</h1>
                                    <div class="h6" style="text-transform:none">江西农业大学
                                    </div>
                                </div>
                                <br>
                                <div class="wow fadeInLeft" data-wow-delay="0.3s">
                                    <c:if test="${empty sessionZeroPoint}">
                                        <c:choose>
                                            <c:when test="${not empty sessionUser}">
                                            	<c:if test="${empty gameInfo }">
	                                            	<a class="btn btn-outline-white waves-effect waves-light" onclick="javascript:alert('目前没有可参加的比赛！'); return false;" href="#">
	                                                    报名参赛
	                                                    <div class="ripple-container"></div>
	                                                </a>
                                            	</c:if>
                                            	<c:if test="${not empty gameInfo}">
                                            		<c:if test="${not empty Teams}">
	                                            		<a class="btn btn-outline-white waves-effect waves-light" onclick="javascript:alert('你已报名参赛，请勿重复报名！'); return false;" href="#">
		                                                    报名参赛
		                                                    <div class="ripple-container"></div>
		                                                </a>
                                            		</c:if>
                                            		<c:if test="${empty Teams}">
                                            			<a class="btn btn-outline-white waves-effect waves-light" href="<c:url value="/user/entoll.jsp" />">
                                                    报名参赛
                                                  			<div class="ripple-container"></div>
                                                        </a>
                                            		</c:if>
                                            	</c:if>
                                                
                                            </c:when>
                                            <c:otherwise>
                                                <a class="btn btn-outline-white waves-effect waves-light" href="<c:url value="/user/login.jsp" />">
                                                    报名参赛
                                                    <div class="ripple-container"></div>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${not empty sessionUser}">
                                            <a class="btn btn-outline-white waves-effect waves-light" href="user/userProfile.jsp">
                                                用户中心
                                                <div class="ripple-container"></div>
                                            </a>
                                        </c:when>
                                        <c:when test="${not empty sessionZeroPoint}">
                                            <a class="btn btn-outline-white waves-effect waves-light" href="user/zeroPoint.jsp">
                                                用户中心
                                                <div class="ripple-container"></div>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-outline-white waves-effect waves-light" href="user/login.jsp">
                                                用户中心
                                                <div class="ripple-container"></div>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="banner0-icon"><i class="anticon anticon-down bounce"></i></div>
                </div>
            </div>
        </section>
    </header>
    <div id="content">
        <section class="row no-gutters" id="features">
            <div class="col-lg-3 col-md-6 col-sm-12 deep-purple lighten-1 text-white">
                <div class="p-5 text-center wow zoomIn" data-wow-delay=".1s">
                    <div class="h5 mt-3">查询</div>
                    <p class="mt-5">登录查看您和其他参赛队伍的作品</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 purple lighten-1 text-white">
                <div class="p-5 text-center wow zoomIn" data-wow-delay=".3s">
                    <div class="h5 mt-3">历史</div>
                    <p class="mt-5">历届比赛的精彩瞬间</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 teal lighten-1 text-white">
                <div class="p-5 text-center wow zoomIn" data-wow-delay=".5s">
                    <div class="h5 mt-3">社交</div>
                    <p class="mt-5">QQ,微信，阿里钉钉</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 light-blue lighten-1 text-white">
                <div class="p-5 text-center wow zoomIn" data-wow-delay=".7s">
                    <div class="h5 mt-3">交流</div>
                    <p class="mt-5">大赛组织与其他高校</p>
                </div>
            </div>
        </section>
        <section class="text-center py-5 grey lighten-4" id="about">
            <div class="container">
                <div class="wow fadeIn">
                    <h2 class="h1 pt-5 pb-3">种类</h2>
                    <p class="px-5 mb-5 pb-3 lead blue-grey-text">
                        喜欢什么？想做什么？
                    </p>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-r wow fadeInUp" data-wow-delay=".3s">
                        <h3 class="h4 mt-3">c/c++</h3>
                        <p class="mt-3 blue-grey-text">
                            黑框框->win32->游戏引擎->底层语言->算法->人工智能->?
                        </p>
                    </div>
                    <div class="col-md-4 mb-r wow fadeInUp" data-wow-delay=".4s">
                        <h3 class="h4 mt-3">python</h3>
                        <p class="mt-3 blue-grey-text">
                            基础功能->图形化->多线程->科学计算->机器学习->深度学习->?
                        </p>
                    </div>
                    <div class="col-md-4 mb-r wow fadeInUp" data-wow-delay=".5s">
                        <h3 class="h4 mt-3">java</h3>
                        <p class="mt-3 blue-grey-text">
                            Applet->数据库->高并发->web->ssh->工程->?
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-5" id="projects">
            <div class="container">
                <div class="wow fadeIn">
                    <h2 class="text-center h1 my-4">参赛人群</h2>
                    <p class="px-5 mb-5 pb-3 lead blue-grey-text text-center">
                    </p>
                </div>
                <div class="row wow fadeInLeft" data-wow-delay=".3s">
                    <div class="col-lg-6 col-xl-5 pr-lg-5 pb-5"><img class="img-fluid rounded z-depth-2"
                                                                 src="picture/card-1.jpg" alt="project image"/></div>
                        <div class="col-lg-6 col-xl-7 pl-lg-5 pb-4">
                            <div class="row mb-3">
                                <div class="col-1 mr-1"></div>
                                <div class="col-10">
                                    <h5 class="font-bold">大一萌新</h5>
                                    <p class="grey-text">
                                        好的开头就是成功的一半
                                    </p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-1 mr-1"></div>
                                <div class="col-10">
                                    <h5 class="font-bold">大二进阶</h5>
                                    <p class="grey-text">
                                        实战让你收获更多
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-1 mr-1"></div>
                                <div class="col-10">
                                    <h5 class="font-bold">大三前辈</h5>
                                    <p class="grey-text">
                                        练手在精不在多
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row pt-5 wow fadeInRight" data-wow-delay=".3s">
                        <div class="col-lg-6 col-xl-7 mb-3">
                            <div class="row mb-3">
                                <div class="col-1 mr-1"></div>
                                <div class="col-10">
                                    <h5 class="font-bold">大四高人</h5>
                                    <p class="grey-text">
                                        展现才能吧
                                    </p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-1 mr-1"></div>
                                <div class="col-10">
                                    <h5 class="font-bold">考研高僧</h5>
                                    <p class="grey-text">
                                        为后来者引航
                                    </p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-1 mr-1"></div>
                                <div class="col-10">
                                    <h5 class="font-bold">外院同学</h5>
                                    <p class="grey-text">
                                        兴趣是让人醉心的事物
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-5 mb-3"><img class="img-fluid rounded z-depth-2" src="picture/card-2.jpeg"
                                                     alt="project image"/></div>
                        </div>
                    </div>
                </div>
        </section>
        <section class="text-center py-5 indigo darken-1 text-white" id="pricing">
            <div class="container">
                <div class="wow fadeIn">
                    <h2 class="h1 pt-5 pb-3">加入咨询</h2>
                    <p class="px-5 mb-5 pb-3 lead">我们的群号：10086
                    </p>
                </div>
                <div class="row wow zoomIn">
                    <div class="col-lg-4 col-md-12 mb-r">
                        <div class="card card-image">
                            <div class="text-white text-center pricing-card d-flex align-items-center rgba-stylish-strong py-3 px-3 rounded">
                                <div class="card-body">
                                    <div class="h5">月赛</div>
                                    <div class="py-5"><sup class="display-4">Mon</sup><span class="display-1">春</span><span
                                    class="display-4">季</span></div>
                                    <ul class="list-unstyled">
                                        <li>
                                            <p><strong>科</strong> 技</p>
                                        </li>
                                        <li>
                                            <p><strong>月月</strong> 评</p>
                                        </li>
                                        <li>
                                            <p><strong>个人</strong> 组</p>
                                        </li>
                                        <li>
                                            <p><strong>？/5</strong> 团队组</p>
                                        </li>
                                    </ul>
                                    <a class="btn btn-outline-white mt-5" href="user/shop"> 了解一下</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 mb-r">
                        <div class="card card-image">
                            <div class="text-white text-center pricing-card d-flex align-items-center rgba-teal-strong py-3 px-3 rounded">
                                <div class="card-body">
                                    <div class="h5">季赛</div>
                                    <div class="py-5"><sup class="display-4">Sea</sup><span class="display-1">挑</span><span
                                    class="display-4">战</span></div>
                                    <ul class="list-unstyled">
                                        <li>
                                            <p><strong>院</strong> 级</p>
                                        </li>
                                        <li>
                                            <p><strong>大赛</strong> 开始</p>
                                        </li>
                                        <li>
                                            <p><strong>个人</strong> 组</p>
                                        </li>
                                        <li>
                                            <p><strong>？/6</strong> 团队组</p>
                                        </li>
                                    </ul>
                                    <a class="btn btn-outline-white mt-5" href="user/shop"> 了解一下</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 mb-r">
                        <div class="card card-image">
                            <div class="text-white text-center pricing-card d-flex align-items-center rgba-red-strong py-3 px-3 rounded">
                                <div class="card-body">
                                    <div class="h5">学年赛</div>
                                    <div class="py-5"><sup class="display-4">Yea</sup><span class="display-1">学</span><span
                                    class="display-4">年</span></div>
                                    <ul class="list-unstyled">
                                        <li>
                                            <p><strong>软</strong> 件</p>
                                        </li>
                                        <li>
                                            <p><strong>创新</strong> 大赛</p>
                                        </li>
                                        <li>
                                            <p><strong>个人</strong> 组</p>
                                        </li>
                                        <li>
                                            <p><strong>？/7</strong> 团队组</p>
                                        </li>
                                    </ul>
                                    <a class="btn btn-outline-white mt-5" href="user/shop"> 了解一下</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!--  <script src="js/jquery.min.js"></script> -->
    <script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
    <script src="js/perfect-scrollbar.jquery.min.js"></script>
    <script src="js/material-dashboard.js"></script>
    <script src="js/material.min.js"></script>
    <script type="text/javascript" src="js/love.js"></script>
    <!--  <script text="text/javascript" src="js/particle.js"></script> -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <script type="text/javascript" src="js/fakeloader.min.js"></script>
    <script type="text/javascript" src="js/sweetalert.min.js"></script>
    <script>
    new WOW().init();
    </script>
    <script>
    $(document).ready(function() {
        var isChrome = navigator.userAgent.toLowerCase().match(/chrome/) != null;
        if (!isChrome) {
            alert("检测您非谷歌浏览器可能会出现不兼容是否继续~!");
        }
        $(".fakeloader").fakeLoader({
            timeToHide: 1500,
            bgColor: "#3498db",
            spinner: "spinner2"
        });
    });
    </script>
</body>

</html>