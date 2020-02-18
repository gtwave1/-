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
    <meta name="theme-color" content="#ff9800">
    <title>个人中心</title>
    <!-- css -->
    <link href="<c:url value="/css/base.min_1.css" />" rel="stylesheet">
    <link href="<c:url value="/css/project.min_1.css" />" rel="stylesheet">
    <link href="<c:url value="/css/4b2aee0df8eb4132b76494c3afe100be.css" />" rel="stylesheet">
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

    .page-orange .ui-content-header {
      background-image: url(../images/amber.jpg);
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
                <a class="menu-logo" href="<c:url value='/user/adminProfile.jsp'/>"><i class="icon icon-lg" >language</i>&nbsp;管理员</a>
                <ul class="nav">
                    <li>
                        <a class="waves-attach" data-toggle="collapse" href="#ui_menu_me">后台管理</a>
                        <ul class="menu-collapse collapse in" id="ui_menu_me">
                            <li>
                                <a href="<c:url value='/UserServlet?method=findAllUser'/>">
                  					<i class="icon icon-lg">account_balance_wallet</i>&nbsp;平台用户
                				</a>
                            </li>
                            <li>
                                <a href="<c:url value='/UserServlet?method=findAllJudge'/>">
                  					<i class="icon icon-lg">account_balance_wallet</i>&nbsp;审核评委
                				</a>
                            </li>
                            <li>
                                <a href="<c:url value='/adminUser/gameInfo.jsp'/>">
                  					<i class="icon icon-lg">account_balance_wallet</i>&nbsp;正在开赛
                				</a>
                            </li>
                            <li>
                                <a href="<c:url value='/adminUser/addJudge.jsp'/>">
                  					<i class="icon icon-lg">account_balance_wallet</i>&nbsp;添加评委
                				</a>
                            </li>
                            <li>
                                <c:choose>
                                	<c:when test="${empty gameInfo }">
                                		<a href="<c:url value='/adminUser/addGame.jsp'/>">
                  							<i class="icon icon-lg">account_balance_wallet</i>&nbsp;发起比赛
                						</a>
                                	</c:when>
                                	<c:otherwise>
                                		<a href="#" onclick="javascript:alert('目前仍有大赛未结束，暂时不能添加大赛'); return false;" href="#">
                  							<i class="icon icon-lg">account_balance_wallet</i>&nbsp;发起比赛
                						</a>
                                	</c:otherwise>
                                </c:choose>
                            </li>
                            <li>
                                <a href="<c:url value='/GameServlet?method=findAll'/>">
                  					<i class="icon icon-lg">account_balance_wallet</i>&nbsp;发布结果
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
                <h1 class="content-heading">用户信息</h1>
            </div>
        </div>
        <div class="container">
            <section class="content-inner margin-top-no">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card margin-bottom-no">
                            <div class="card-main">
                                <div class="card-inner">
                                    <div class="card-inner">
                                        <p class="card-heading">用户总览</p>
                                        <div class="card-table">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <tr>
                                                        <th>用户姓名</th>
														<th>用户学号</th>
														<th>用户性别</th>
														<th>所属学院</th>
														<th>所选专业</th>
														<th>所在班级</th>
														<th>联系方式</th>
														<th>QQ号码</th>
														<th>email</th>
                                                    </tr>
                                                    <c:forEach items="${pb.beanList}" var="cstm">
														<tr>
															<td>${cstm.name}</td>
															<td>${cstm.id}</td>
															<td>${cstm.sex}</td>
															<td>${cstm.yuanxi}</td>
															<td>${cstm.major}</td>
															<td>${cstm.class1}</td>
															<td>${cstm.phone}</td>
															<td>${cstm.qqNumber}</td>
															<td>${cstm.email}</td>
															<td>
																<a href="<c:url value='/UserServlet?method=preEdit&id=${cstm.id}'/>">编辑</a>&nbsp;
																<a href="<c:url value='/UserServlet?method=deleteUser&cid=${cstm.id}'/>">删除</a>
															</td>
														</tr>
													</c:forEach>
                                                </table>
                                                <br/>
                                                <div align="center">
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
												</div>
                                            </div>
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
    <script src="<c:url value="/js/jquery.min.js" />"></script>
    <script src="<c:url value="/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/js/gt.js" />"></script>
    <script src="<c:url value="/js/base.min.js" />"></script>
    <script src="<c:url value="/js/project.min.js" />"></script>
    <script src="<c:url value="/js/clipboard.min.js" />"></script>
    <script src="<c:url value="/js/mdialogmin.js" />"></script>
    <script type="text/javascript" color="217,113,24" opacity="0.8" count="99" src="<c:url value="/js/canvas-nest.min.js" />"></script>
    <c:if test="${not empty msg }">
    	<script type="text/javascript">
    	window.onload=function(){
    		window.location.href="<c:url value='/UserServlet?method=findAllUser' />"
    		alert("${msg}");
		}
    	</script>
    </c:if>
</body>

</html>