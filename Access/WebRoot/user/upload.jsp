<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0042)file:///C:/Users/Amireux/Desktop/info.html -->
<html lang="zh-cn" class=" no-touchevents no-touchevents">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
    <meta name="theme-color" content="#ff9800">
    <title>参赛项目</title>
    <!-- css -->
    <link href="./upload_files/css/project.min_1.css" rel="stylesheet">
    <link href="./upload_files/css/4b2aee0df8eb4132b76494c3afe100be.css" rel="stylesheet">
    <link href="https://fonts.loli.net/css?family=Material+Icons">
    <link href="./upload_files/css/base.min_1.css" rel="stylesheet">
    <link href="./upload_files/css/main.css" rel="stylesheet">
    <link href="./upload_files/css/base1.css" rel="stylesheet">
    <link href="./upload_files/css/bootstrap.min.css" rel="stylesheet">
    <!-- <link href="D:\vscode\css\info\reset.css" rel="stylesheet"> -->
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
    <main class="content">
        <div class="content-header ui-content-header">
            <div class="container">
                <h1 class="content-heading" style="text-align: center;">项目提交</h1>
            </div>
        </div>
        <div class="container">
            <section class="content-inner margin-top-no">
                <div class="ui-card-wrap">
                    <div class="col-lg-6 col-md-6" style="width:1150px">
                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner margin-bottom-no">
                                    <p class="card-heading" style="text-align: center;">创建项目</p>
                                    <form class="form-horizontal form-repair" role="form" action="<c:url value='/ProjectServlet?method=add&id=${sessionUser.id }'/>" method="post" enctype="multipart/form-data">
                                        <!-- <input type="hidden" name="id" value="${sessionUser.id }"/> -->
                                        <div>
                                            <div class="form-group">
                                                <div class="f16  mt6 form-divider mb20">
                                                    <strong>基本信息</strong>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="pull-left field-label single-line">
                                                    <span class="txt-ce36564 star">*</span>
                                                    <span class="f14 mr20">项目名称</span>
                                                </div>
                                                <div class="pull-left">
                                                    <input type="text" maxlength="50" class="form-control w330" name="name" id="projectName" placeholder="简洁清晰，不多于50字" value="">
                                                    <p style="color:#e15554;margin-top:2px;margin-bottom:-5px;">提示：提交成功后，项目名称不可修改</p>
                                                </div>
                                                <small class="help-block hidden" id="existTip">该项目名称已存在，请选择其他名称</small>
                                            </div>
                                            <div class="form-group mt34">
                                                <div class="f16 form-divider">
                                                    <strong>项目介绍</strong>
                                                </div>
                                            </div>
                                            <div class="form-group textarea-group">
                                                <div class="pull-left field-label single-line">
                                                    <span class="txt-ce36564 star">*</span>
                                                    <span class="f14 mr20">项目概述</span>
                                                </div>
                                                <div class="pull-left textarea-box">
                                                    <div class="tip hidden">可拆分为产品描述、用户群体、项目愿景、竞争对手等方面详细描述，不超过1000字。</div>
                                                    <textarea class="form-control intro-text" id="synopsis" name="synopsis" maxlength="1000" placeholder="可拆分为产品描述、用户群体、项目愿景、竞争对手等方面详细描述，不超过1000字。"></textarea>
                                                    <div class="text-count"><span class="count">0</span>/<span>1000</span></div>
                                                </div>
                                            </div>
                                            <div class="form-group mt34">
                                                <div class="f16 form-divider">
                                                    <strong>认证信息</strong>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="form-group">
                                                <div class="pull-left field-label single-line">
                                                    <span class="txt-ce36564 star">*</span>
                                                    <span class="f14 mr20">项目负责人</span>
                                                </div>
                                                <div class="pull-left">
                                                    <input type="text" class="form-control w330 color-readonly" name="equityStructures[0].shareholder" value="${sessionUser.name }" placeholder="请填写" readonly="">
                                                </div>
                                            </div>
                                            <!-- 项目计划书 -->
                                            <div class="form-group">
                                                <div class="pull-left field-label single-line">
                                                    <span class="txt-ce36564 star">*</span>
                                                    <span class="f14 mr20">项目计划书</span>
                                                </div>
                                                <div class="pull-left mt20 mid-box">
                                                <input type="file" accept="application/msword, application/pdf, application/vnd.openxmlformats-officedocument.wordprocessingml.document" name="word">
                                                    <p class="upload-tip fc2">格式为pdf、word，不超过20M，文件数量限一个。
                                                    	<span id="ieTip" class="hidden">（IE10浏览器请双击选择文件。）</span>
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- 项目视频 -->
                                            <div class="form-group">
                                                <div class="pull-left field-label single-line">
                                                    <span class="txt-ce36564 star">*</span>
                                                    <span class="f14 mr20">项目视频</span>
                                                </div>
                                                <div class="pull-left mt20 mid-box">
														<input type="file" accept="video/*" name="video">
                                                    <p class="upload-tip fc2">视频大小不超过200M，时长不超过5分钟，视频数量限一个。<span id="ieTip" class="hidden">（IE10浏览器请双击选择文件。）</span>
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- 项目源码 -->
                                            <div class="form-group">
                                                <div class="pull-left field-label single-line">
                                                    <span class="txt-ce36564 star">*</span>
                                                    <span class="f14 mr20">项目源码</span>
                                                </div>
                                                <div class="pull-left mt20 mid-box">
													<input type="file" name="code">
                                                    <p class="upload-tip fc2">源码打包为rar、zip、7z格式，数量限一个。<span id="ieTip" class="hidden">（IE10浏览器请双击选择文件。）</span>
                                                    </p>
                                                </div>
                                            </div>
                                            <button type="submit" class="hide" id="hiddenSub"></button>
                                            <div class="form-group">
                                                <span class="txt-ce36564 star"></span>
                                                <span class="f14 mr20"></span>
                                                <input type="submit" id="subForm" class="btn btn-default btn-lg w330 br4 apply-button h50 fc4">
                                            </div>
                                        </div>
                                    </form>

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
                                        <p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" type="button" id="result_ok">知道了</button></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main><span style="position: absolute; left: 0px; top: -20000px; padding: 0px; margin: 0px; border: none; white-space: pre; line-height: normal; font-family: Garamond; font-size: 20px; font-weight: normal; display: none;">Mpgyi</span>
    <!-- js -->
    <script src="./upload_files/js/jquery.min.js"></script>
    <script src="./upload_files/js/jquery.validate.min.js"></script>
    <script src="./upload_files/js/gt.js"></script>
    <script src="./upload_files/js/base.min.js"></script>
    <script src="./upload_files/js/project.min.js"></script>
    <script src="./upload_files/js/clipboard.min.js"></script>
    <script type="text/javascript" color="217,113,24" opacity="0.8" count="99" src="./upload_files/js/canvas-nest.min.js"></script><canvas id="c_n7" width="1536" height="710" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.8;"></canvas><canvas id="c_n9" width="982" height="710" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.8;"></canvas>
    <script src="./upload_files/js/bootstrap-datetimepicker.js"></script>
    <script src="./upload_files/js/mains.js"></script>
    <script src="./upload_files/js/jQuery-1.11.1.min.js"></script>
    <script src="./upload_files/js/shake.js"></script>
    <script></script>
</body>

</html>