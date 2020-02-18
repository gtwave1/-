<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html xmlns:shiro="http://www.ncss.cn/thymeleaf/shiro">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="x-dns-prefetch-control" content="on">
<link rel="dns-prefetch" href="//t1.chei.com.cn">
<link rel="dns-prefetch" href="//t2.chei.com.cn">
<link rel="dns-prefetch" href="//t3.chei.com.cn">
<link rel="dns-prefetch" href="//t4.chei.com.cn">
<link rel="dns-prefetch" href="//www.google-analytics.com">
<meta name="renderer" content="webkit" />
<meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=3600" />
<!-- <meta HTTP-EQUIV="Pragma" CONTENT="no-cache" />
<meta HTTP-EQUIV="Expires" CONTENT="0" /> -->
<link rel="icon" href="//t3.chei.com.cn/ncss/cy/web/img/favicon.ico" />
<link rel="stylesheet" href="<c:url value="/project/css/bootstrap.min.css" />" />
<link rel="stylesheet" href="<c:url value="/project/css/common.css" />" />
<link rel="stylesheet" href="<c:url value="/project/css/modal.css" />" />
<script src="<c:url value="/project/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/project/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/project/js/back_to_top.js" />"></script>
<title>项目展示</title>

<script src="<c:url value="/project/js/boomerang-min-20141211.js" />" type="text/javascript"></script>
<script type="text/javascript">
BOOMR.init({
    beacon_url: "//www.chsi.com.cn/images/perf.gif",
    log: null,
    DNS:{
        base_url: "//*.chdi.com.cn/images/"
    }
});
</script>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-105074615-4', 'auto');
        ga('send', 'pageview');
</script>
</head>
<link rel="stylesheet" href="<c:url value="/project/css/iconfont.css" />" />
<link rel="stylesheet" href="<c:url value="/project/css/newdetails.css" />" />

<body>
    <div class="mc">
        <div>
    		<div class="mobile-tip hidden" style="text-align:center;width:1180px;font-size:32px;padding:10px 0;margin:0 auto;color:darkred;">为了获得更好的体验，请使用电脑版浏览器。</div>
  		</div>
  		<c:choose>
  			<c:when test="${empty project}">
  				<div align="center" style="margin-top: 100px;">
  					<h1>您还未提交项目，是否需要提交？</h1>
  					<a href="<c:url value="/user/upload.jsp"/>" class="btn btn-primary">项目提交</a>
  					<a href="<c:url value="/user/userProfile.jsp"/>" class="btn btn-primary">返回</a>
  				</div>
  			</c:when>
  			<c:otherwise>
				<div class="banner">
					<div class="container banner-inner">
						<div class="banner-top clearfix">
							<div class="info-box">
								<h1>${project.name }</h1>
								<a href="<c:url value="/user/userProfile.jsp"/>"
									class="btn btn-primary">返回</a>
							</div>
						</div>
					</div>
				</div>
				<div class="nav" id="navbar">
					<ul class="container nav-inner clearfix">
						<li><a data-href="contest" class="active">参赛信息</a></li>
						<li><a data-href="project">项目信息</a></li>

					</ul>
				</div>
				<div class="container main-content">
					<div class="content-box" id="contest">
						<h5>
							<i class="iconfont icon-trophy1"></i> 参赛信息
						</h5>

						<div class="content-block">
							<p>
								参赛状态： <span><c:choose>
								<c:when test="${sessionUser.statu == 2 }">项目待评委审核</c:when>
								<c:when test="${sessionUser.statu == 3 }">审核结束，请等待结果公示</c:when>
								<c:otherwise>${id_team.result }</c:otherwise>
								</c:choose></span>

							</p>
							<p>
								参赛组别： <span>${id_team.kind }</span>
							</p>
							<p>
								参赛类别： <span>${id_team.category }</span>
							</p>
							<p>
								报名时间： <span>${id_team.date }</span>
							</p>
						</div>
					</div>
					<div class="content-box" id="project">
						<h5>
							<i class="iconfont icon-list1"></i>项目信息
						</h5>
						<div class="content-block">
							<h6>项目概述</h6>
							<p>${project.synopsis }</p>
						</div>
						<div class="content-block">
							<h6>项目附件</h6>
							<div class="att-box">
								<div class="project-flie">
									<a href="<c:url value='../ProjectServlet?method=download&tid=${id_team.id}'/>" class="btn btn-primary">下载</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
  		</c:choose>
  	</div>
    <script>
    
    $(document).ready(function() {
      var windowHeight = $(window).height();
      var bodyHeight = $(document.body).height();
      var dValue = windowHeight - bodyHeight;
      if (dValue > 0) {
        dValue += 56;
        $("#stick").css("height", dValue);
      }
      $('#prompts,#notToday').find('.modal-dialog').css({
        'margin-top' : windowHeight / 2 -200
      });
      var Sys = {},
        ua = navigator.userAgent.toLowerCase(),
        s,
        mobileAgent = ["iphone", "ipod", "ipad", "android", "mobile", "blackberry", "webos", "incognito", "webmate", "bada", "nokia", "lg", "ucweb", "skyfire"];
      (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1]:0;
      if (Sys.ie) {
        if (parseFloat(Sys.ie) < 10) {
          $('#prompts').modal('show');
        }
      };
      for (var i=0; i<mobileAgent.length; i++){ 
        if (ua.indexOf(mobileAgent[i])!=-1){ 
          $(".mobile-tip").removeClass("hidden");
          break; 
        }
      };
    });
  </script>
  <script>
        $.ajax({
            url : "/mymessage/unreadcount",
            type : 'get',
            cache : false,
            success : function(data) {
                if(data>0){
                    $(".account-nav-main .dot").removeClass("hidden");
                }else{
                    $(".account-nav-main .dot").addClass("hidden");
                }
            },
        });
    </script>
    
  </div>
    <div class="shortcut-menu">
        <div class="shortcut-menu-item back-to-top2"></div>
    </div>
	

    <script src="<c:url value="/project/js/common.js" />"></script>
    <script>
        $(function () {
            var topArr = [];
            $(".content-box").each(function () {
                topArr.push($(this).offset().top);
            });

            var $window = $(window);

            function setActive(){
                var winSt = $window.scrollTop();
                //console.log(winSt);
                if (winSt > 237) {
                    $("#navbar").css({
                        "position": "fixed",
                        "top": "0"
                    });
                    $(".banner").css("height","220");
                } else {
                    $("#navbar").css({
                        "position": "static"
                    });
                    $(".banner").css("height","174");
                }

                for (var i = 0; i < topArr.length; i++) {
                    if (i < topArr.length - 1) {
                        if (winSt > topArr[i] - 52 && winSt < topArr[i + 1] - 52) {
                            $('[data-href]').removeClass("active");
                            $('[data-href]').eq(i).addClass("active");
                            break;
                        }
                    } else {
                        if (winSt > topArr[i] - 60) {
                            $('[data-href]').removeClass("active");
                            $('[data-href]').eq(i).addClass("active");
                            break;
                        }
                    }
                }
            }
            
            setActive();
            
            $('[data-href]').on("click", function () {
                var $this = $(this);
                var tempId = $(this).attr("data-href");
                var index = $this.parent().index();
                if (index == 0) {
                    $("html,body").animate({
                        scrollTop: 0
                    }, 200, function () {
                        $('[data-href]').removeClass("active");
                        $this.addClass("active");
                    });
                } else {
                    $("html,body").animate({
                        scrollTop: topArr[index] - 52
                    }, 200, function () {
                        $('[data-href]').removeClass("active");
                        $this.addClass("active");
                    });
                }


            });
            
            $(".back-to-top2").on("click",function(){
                $('[data-href]').eq(0).click();
            });

            $window.on("scroll", function () {
                setActive();
            });
            $('#closeVideo').on('click', function () {
                var video = document.getElementById('customVideo');
                video.pause();
            });
            $("#videomodal .modal-dialog").css("margin-top", $window.height() / 2 - 250);
        });
    </script>
</body>


</html>