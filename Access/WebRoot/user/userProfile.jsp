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
    <meta name="theme-color" content="#ff9800">
    <title>用户中心</title>
    <!-- css -->
    <link href="../css/base.min_1.css" rel="stylesheet">
    <link href="../css/project.min_1.css" rel="stylesheet">
    <link href="../css/dialog.css" rel="stylesheet">
    <link href="../css/4b2aee0df8eb4132b76494c3afe100be.css" rel="stylesheet">
    <link href="https://fonts.loli.net/css?family=Material+Icons">
    <style>
        body {
        background: #eee;
    }

    @keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            transform: rotate(1080deg);
        }
        100% {
            transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    @-webkit-keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            -webkit-transform: rotate(1080deg);
        }
        100% {
            -webkit-transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    @-moz-keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            -moz-transform: rotate(1080deg);
        }
        100% {
            -moz-transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    @-ms-keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            -ms-transform: rotate(1080deg);
        }
        100% {
            -ms-transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    @-o-keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            -o-transform: rotate(1080deg);
        }
        100% {
            -o-transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    .roll {
        position: absolute;
        opacity: 0;
        animation: mysnow 5s;
        -webkit-animation: mysnow 5s;
        -moz-animation: mysnow 5s;
        -ms-animation: mysnow 5s;
        -o-animation: mysnow 5s;
        height: 80px;
    }

    .div {
        position: fixed;
    }
    </style>
    <!-- favicon -->
    <!-- ... -->
    <style>
        .pagination {
      display:inline-block;
      padding-left:0;
      margin:20px 0;
      border-radius:4px
    }
    .pagination>li {
      display:inline
    }
    .pagination>li>a,.pagination>li>span {
      position:relative;
      float:left;
      padding:6px 12px;
      margin-left:-1px;
      line-height:1.42857143;
      color:#337ab7;
      text-decoration:none;
      background-color:#fff;
      border:1px solid #ddd
    }
    .pagination>li:first-child>a,.pagination>li:first-child>span {
      margin-left:0;
      border-top-left-radius:4px;
      border-bottom-left-radius:4px
    }
    .pagination>li:last-child>a,.pagination>li:last-child>span {
      border-top-right-radius:4px;
      border-bottom-right-radius:4px
    }
    .pagination>li>a:focus,.pagination>li>a:hover,.pagination>li>span:focus,.pagination>li>span:hover {
      color:#23527c;
      background-color:#eee;
      border-color:#ddd
    }
    .pagination>.active>a,.pagination>.active>a:focus,.pagination>.active>a:hover,.pagination>.active>span,.pagination>.active>span:focus,.pagination>.active>span:hover {
      z-index:2;
      color:#fff;
      cursor:default;
      background-color:#337ab7;
      border-color:#337ab7
    }
    .pagination>.disabled>a,.pagination>.disabled>a:focus,.pagination>.disabled>a:hover,.pagination>.disabled>span,.pagination>.disabled>span:focus,.pagination>.disabled>span:hover {
      color:#777;
      cursor:not-allowed;
      background-color:#fff;
      border-color:#ddd
    }
    .pagination-lg>li>a,.pagination-lg>li>span {
      padding:10px 16px;
      font-size:18px
    }
    .pagination-lg>li:first-child>a,.pagination-lg>li:first-child>span {
      border-top-left-radius:6px;
      border-bottom-left-radius:6px
    }
    .pagination-lg>li:last-child>a,.pagination-lg>li:last-child>span {
      border-top-right-radius:6px;
      border-bottom-right-radius:6px
    }
    .pagination-sm>li>a,.pagination-sm>li>span {
      padding:5px 10px;
      font-size:12px
    }
    .pagination-sm>li:first-child>a,.pagination-sm>li:first-child>span {
      border-top-left-radius:3px;
      border-bottom-left-radius:3px
    }
    .pagination-sm>li:last-child>a,.pagination-sm>li:last-child>span {
      border-top-right-radius:3px;
      border-bottom-right-radius:3px
    }
    .pager {
      padding-left:0;
      margin:20px 0;
      text-align:center;
      list-style:none
    }
    .pager li {
      display:inline
    }
    .pager li>a,.pager li>span {
      display:inline-block;
      padding:5px 14px;
      background-color:#fff;
      border:1px solid #ddd;
      border-radius:15px
    }
    .pager li>a:focus,.pager li>a:hover {
      text-decoration:none;
      background-color:#eee
    }
    .pager .next>a,.pager .next>span {
      float:right
    }
    .pager .previous>a,.pager .previous>span {
      float:left
    }
    .pager .disabled>a,.pager .disabled>a:focus,.pager .disabled>a:hover,.pager .disabled>span {
      color:#777;
      cursor:not-allowed;
      background-color:#fff
    }





    .pagination>li>a,
    .pagination>li>span {
      border: 1px solid white;
    }
    .pagination>li.active>a {
      background: #f50057;
      color: #fff;
    }

    .pagination>li>a {
      background: white;
      color: #000;
    }


    .pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
      color: #fff;
      background-color: #000;
      border-color: #000;
    }

    .pagination>.active>span {
      background-color: #f50057;
      color: #fff;
      border-color: #fff;
    }



    .pagination > .disabled > span {
      border-color: #fff;
    }


    pre {
      white-space: pre-wrap;
      word-wrap: break-word;
    }

    .progress-green .progress-bar {
      background-color: #f0231b;
    }

    .progress-green {
      background-color: #000;
    }

    .progress-green .progress-bar {
      background-color: #ff0a00;
    }


    .content-heading {
      font-weight: 300;
      color: #fff;
    }
  </style>
</head>

<body class="page-orange">
    <header class="header header-orange header-transparent header-waterfall ui-header">
        <ul class="nav nav-list pull-left">
            <div>
                <a data-toggle="menu" href="#ui_menu">
          <span class="icon icon-lg text-white">format_align_justify</span>
        </a>
            </div>
        </ul>
        <ul class="nav nav-list pull-right">
            <div class="dropdown margin-right">
                <a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
                    <span class="icon icon-cd margin-right">account_circle</span>
          		</a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li>
                        <a class="padding-right-cd waves-attach" href="<c:url value="/UserServlet?method=logout" />"><span class="icon icon-lg margin-right">exit_to_app</span>登出</a>
                    </li>
                </ul>
            </div>
        </ul>
    </header>
    
    <nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
        <div class="menu-scroll">
            <div class="menu-content">
                <a class="menu-logo" href="<c:url value="/welcome.jsp" />"><i class="icon icon-lg" >language</i>&nbsp;首页</a>
                <ul class="nav">
                    <li>
                        <a class="waves-attach" data-toggle="collapse" href="#ui_menu_me">我的</a>
                        <ul class="menu-collapse collapse in" id="ui_menu_me">
                            <li>
                                <a href="<c:url value='userProfile.jsp' />">
                                    <i class="icon icon-lg">account_box</i>&nbsp;个人信息
                                </a>
                            </li>
                        </ul>
                        <a class="waves-attach" data-toggle="collapse" href="#ui_menu_use">项目</a>
                        <ul class="menu-collapse collapse in" id="ui_menu_use">
                            <li>
                                <a href="<c:url value='/zzz/pai.jsp'/>">
                                    <i class="icon icon-lg">vertical_align_top</i>&nbsp;比赛结果
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="content">
        <div class="content-header ui-content-header">
            <div class="container">
                <h1 class="content-heading">个人信息</h1>
            </div>
        </div>
        <p style="color: red; font-weight: 900">${msg }</p>
        <div class="container">
            <section class="content-inner margin-top-no">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card margin-bottom-no">
                            <div class="card-main">
                                <div class="card-inner">
                                    <div class="card-inner">
                                        <p class="card-heading">个人资料</p><span><a a href="<c:url value='/edit.jsp'/>" >编辑</a></span>
                                        <div class="card-table">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <tr>
                                                        <th>姓名</th>
                                                        <td>${sessionUser.name }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>性别</th>
                                                        <td>${sessionUser.sex }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>邮箱</th>
                                                        <td>${sessionUser.email }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>学号</th>
                                                        <td>${sessionUser.id }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>院系</th>
                                                        <td>${sessionUser.yuanxi }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>专业</th>
                                                        <td>${sessionUser.major }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>班级</th>
                                                        <td>${sessionUser.class1 }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>联系方式</th>
                                                        <td>${sessionUser.phone }</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner margin-bottom-no">
                                    <p class="card-heading">我的比赛</p>
                                    <div class="card-table">
                                        <div class="table-responsive">
                                            <c:choose>
                                                <c:when test="${sessionUser.statu == 0}">
                                                    <div align="center">
                                                    <p style="padding: 0; margin: 0;">您目前还未报名参赛！</p>
                                                    <c:if test="${empty gameInfo }">
	                                            	<a href="#" onclick="javascript:alert('目前没有可参加的比赛！'); return false;" >
	                                                    报名参赛
	                                                    <div class="ripple-container"></div>
	                                                </a>
                                            	</c:if>
                                            	<c:if test="${not empty gameInfo }">
                                            		<a href="<c:url value="/user/entoll.jsp" />">
                                                    报名参赛
                                                    <div class="ripple-container"></div>
                                                </a>
                                            	</c:if>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <table class="table">
                                                        <tr>
                                                            <th>参赛名称</th>
                                                            <th>参赛时间</th>
                                                            <th>参赛组别</th>    
                                                            <th>比赛状态</th>
                                                            <th></th>
                                                        </tr>
                                                        <tr>
                                                            <td>${gameInfo.name }</td>
                                                            <td>${gameInfo.end }</td>
                                                            <td>
                                                            	<c:choose>
                                                            		<c:when test="${gameInfo.kind == 0 }">
                                                            			全年级
                                                            		</c:when>
                                                            		<c:otherwise>
                                                            			${id_team.kind }
                                                            		</c:otherwise>
                                                            	</c:choose>                                                           
                                                            </td>
                                                            
                                                            <td>
                                                            	<c:choose>
                                                            		<c:when test="${sessionUser.statu == 1}">
                                                            			项目未提交
                                                            		</c:when>
                                                            		<c:when test="${sessionUser.statu == 2}">
                                                            			项目待审核
                                                            		</c:when>
                                                            		<c:when test="${sessionUser.statu == 3}">
                                                            			等待结果公示
                                                            		</c:when>
                                                            		<c:otherwise>
                                                            			${Teams.reasult }
                                                            		</c:otherwise>
                                                            	</c:choose>
                                                            </td>
                                                            <td><a href="<c:url value="/project/project.jsp" />">查看详情</a></td>
                                                        </tr>
                                                    </table>
                                                </c:otherwise>
                                            </c:choose>
                                            <%--<table class="table">
                                                <tr>
                                                    <th>参赛名称</th>
                                                    <th>参赛时间</th>
                                                    <th>比赛状态</th>
                                                    <th>比赛结果</th>
                                                    <th>项目名称</th>
                                                    <th></th>
                                                </tr>
                                                <tr>
                                                    <td>科技月月评</td>
                                                    <td>2018年12月17日</td>
                                                    <td>待审核</td>
                                                    <td></td>
                                                    <td>江西农业大学大创网</td>
                                                    <td><a href="<c:url value="/ProjectServlet?method=find&id=${sessionUser.id}" />">查看详情</a></td>
                                                </tr>
                                            </table>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner margin-bottom-no">
                                    <p class="card-heading">我的团队</p>
                                    <div class="card-table">
                                        <div class="table-responsive">
                                        <c:choose>
                                                <c:when test="${empty Teams}">
                                                    <div align="center">
                                                    <p style="padding: 0; margin: 0;">您未加入任何团队</p>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
		                                            <table class="table">
		                                                <tr>
		                                                    <th>姓名</th>
		                                                    <th>QQ号</th>
		                                                    <th>手机号码</th>
		                                                    <th>邮箱</th>
		                                                    <th></th>
		                                                </tr>
		                                                <c:forEach items="${Teams}" var="cstm">
														<tr>
															<td>${cstm.name }</td>
															<td>${cstm.qqNumber }</td>
															<td>${cstm.phone }</td>
															<td>${cstm.email }</td>
														
														</tr>
														</c:forEach>
		                                            </table>
                                            	</c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>
    <!-- js -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <script src="../js/gt.js"></script>
    <script src="../js/base.min.js"></script>
    <script src="../js/project.min.js"></script>
    <script src="../js/clipboard.min.js"></script>
    <script src="../js/mdialogmin.js"></script>
    <script type="text/javascript" color="217,113,24" opacity="0.8" count="99" src="../js/canvas-nest.min.js"></script>
</body>

</html>