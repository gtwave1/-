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
    <title>用户信息</title>
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
                  <span class="access-hide">MrBrutalchiefs</span>
                    <span class="icon icon-cd margin-right">account_circle</span>
          </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li>
                        <a class="padding-right-lg waves-attach" href="/user/userProfile.jsp"><span class="icon icon-lg margin-right">account_box</span>用户中心</a>
                    </li>
                    <li>
                        <a class="padding-right-cd waves-attach" href="/user/logout"><span class="icon icon-lg margin-right">exit_to_app</span>登出</a>
                    </li>
                </ul>
            </div>
        </ul>
    </header>
    <nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
        <div class="menu-scroll">
            <div class="menu-content">
                <a class="menu-logo" href="/"><i class="icon icon-lg" >language</i>&nbsp;用户界面</a>
                <ul class="nav">
                    <li>
                        <a class="waves-attach" data-toggle="collapse" href="#ui_menu_me">我的</a>
                        <ul class="menu-collapse collapse in" id="ui_menu_me">
                            <li>
                                <a href="/user">
                  <i class="icon icon-lg">account_balance_wallet</i>&nbsp;用户中心
                </a>
                            </li>
                            <li>
                                <a href="/user/profile">
                  <i class="icon icon-lg">account_box</i>&nbsp;个人信息
                </a>
                            </li>
                            <!--              <li>
                <a href="/user/ticket">
                  <i class="icon icon-lg">question_answer</i>&nbsp;关注评委
                </a>
              </li>

                                             <li>
                <a href="/user/invite">
                  <i class="icon icon-lg">loyalty</i>&nbsp;邀请链接
                </a>
              </li> -->
                        </ul>
                        <a class="waves-attach" data-toggle="collapse" href="#ui_menu_use">项目</a>
                        <ul class="menu-collapse collapse in" id="ui_menu_use">
                            <li>
                                <a href="/user/node">
                  <i class="icon icon-lg">airplanemode_active</i>&nbsp;项目总览
                </a>
                            </li>
                            <li>
                                <a href="/zzz/pai.jsp">
                  <i class="icon icon-lg">vertical_align_top</i>&nbsp;总分排行
                </a>
                            </li>
                            <li>
                                <a href="/user/relay">
                  <i class="icon icon-lg">compare_arrows</i>&nbsp;评委反馈
                </a>
                            </li>
                            <li>
                                <a href="/user/lookingglass">
                  <i class="icon icon-lg">visibility</i>&nbsp;关注他人
                </a>
                                <a href="/user/announcement">
                  <i class="icon icon-lg">start</i>&nbsp;上传教程
                </a>
                            </li>
                        </ul>
                        <a class="waves-attach" data-toggle="collapse" href="#ui_menu_detect">帮助</a>
                        <ul class="menu-collapse collapse in" id="ui_menu_detect">
                            <li><a href="/user/detect"><i class="icon icon-lg">account_balance</i>&nbsp;页面帮助</a></li>
                            <li><a href="/user/detect/log"><i class="icon icon-lg">assignment_late</i>&nbsp;异常反馈</a></li>
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
        <div class="container">
            <section class="content-inner margin-top-no">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card margin-bottom-no">     
                        </div>
                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner margin-bottom-no">
                                    <p class="card-heading">我的比赛</p>
                                    <div class="card-table">
                                        <div class="table-responsive">
                                            <table class="table">
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
                                                    <td><a href="#">查看详情</a></td>
                                                </tr>
                                                <tr>
                                                    <td>软件创新创业大赛</td>
                                                    <td>2017年6月1日</td>
                                                    <td>已结束</td>
                                                    <td>二等奖</td>
                                                    <td>虎鱼网电商平台</td>
                                                    <td><a href="#">查看详情</a></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner margin-bottom-no">
                                    <p class="card-heading">我的团队</p>
                                    <p><a href="javascript:void(0);" onclick="addMember()">添加成员</a></p>
                                    <div class="card-table">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <tr>
                                                    <th>姓名</th>
                                                    <th>QQ号</th>
                                                    <th>手机号码</th>
                                                    <th>邮箱</th>
                                                    <th></th>
                                                </tr>
                                                <tr>
                                                    <td>郭涛</td>
                                                    <td>269****782</td>
                                                    <td>181****3457</td>
                                                    <td>269****782@qq.com</td>
                                                    <td><a href="#">删除</a></td>
                                                </tr>
                                                <tr>
                                                    <td>郭涛</td>
                                                    <td>269****782</td>
                                                    <td>181****3457</td>
                                                    <td>269****782@qq.com</td>
                                                    <td><a href="#">删除</a></td>
                                                </tr>
                                                <tr>
                                                    <td>郭涛</td>
                                                    <td>269****782</td>
                                                    <td>181****3457</td>
                                                    <td>269****782@qq.com</td>
                                                    <td><a href="#">删除</a></td>
                                                </tr>
                                            </table>
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
    <script type="text/javascript">
    	function addMember() {
		    	Dialog.init("请输入新成员的学号及姓名进行添加<br/><input type=\"text\" placeholder=\"学号，例:20162313\"  style=\"margin:8px 0;width:100%;padding:11px 8px;font-size:15px; border:1px solid #999;\"/>", {
		          	title: "添加新成员",
		          	//style: 'padding: 30px 14px;color:red;font-weight: bold;font-size:25px',
		          	button: {
		            	添加: function(){
		                  	if (this.querySelector('input').value == '20162313') {
                    			Dialog.init('添加成功！');
                    			Dialog.close(this);
                			} else {
                    			Dialog.init('该用户不存在或未注册！', 1100);
                			};
		              	}
		            }
		       });
		    }
		    
		function exit(){
			Dialog.init("修改你需要修改的基本信息", {
		          	title: "修改个人信息",
		          	//style: 'padding: 30px 14px;color:red;font-weight: bold;font-size:25px',
		          	button: {
		            	保存: function(){
		                  // Dialog.init('你点击了确定',1000);
		                  Dialog.close(this);
		              	}
		            }
		       });
		}
    </script>
</body>

</html>