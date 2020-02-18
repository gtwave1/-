<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
    <meta name="theme-color" content="#3f51b5">
    <title>软件学院</title>
    <meta name="keywords" content="软件学院">
    <meta name="description" content="江西农业大学软件学院大创网">
    <!-- css -->
    <!--<link href="css/base.css" rel="stylesheet">
  <link href="css/project.css" rel="stylesheet">
  <link href="css/bb3c2519d4e54984849ce0515c006822.css" rel="stylesheet">
     -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/material-dash.css" rel="stylesheet">
   
    <link rel="stylesheet" href="css/animate.min.css">
    <link href="css/sweetalert.css" rel="stylesheet">
    <script type="text/javascript" src="js/sweetalert.min.js"></script>
    <link href="css/bb3c2519d4e54984849ce0515c006822.css" rel="stylesheet">
    <!-- favicon -->
    <!-- ... -->
    <link rel="shortcut icon" href="/favicon.ico" />
    <link rel="bookmark" href="/favicon.ico" />
</head>
<style>
    @import url(css/font-awesome.min.css);
 
.input-group {
     padding-top: 10px;
     padding-bottom: 10px;
}
   
@font-face { 
  font-family: title-speed;
  src: url('/fonts/LobsterTwo-Regular.otf');
} 

.navbar-brand{
  font-family: title-speed;
  font-size: 1.2rem;
  font-weight: 500;
  
 }
  .testthis{
      /*position:absolute;*/
      background-size: contain;
      position: center;
      top:0;
      bottom:0;
      left:0;
      right:0;
      width:100%;
      margin:auto;
  }
 
 </style>

<body class="off-canvas-sidebar">
    <nav class="navbar navbar-primary navbar-transparent navbar-absolute">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand animated swing" href="welcome.jsp">软件学院</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li id="homt_carte">
                        <a href="welcome.jsp">
                            首页
                        </a>
                    </li>
                    <li id="login_carte">
                        <a href="user/login.jsp">
                            登录
                        </a>
                    </li>
                    <li id="register_carte">
                        <a href="user/register.jsp">
                            注册
                        </a>
                    </li>
                    <li>
                        <a href="forget.jsp">
                           找回密码
                        </a>
                    </li>
                    <!--<li id="tos_carte">-->
                    <!--<a href="/tos">-->
                    <!--<i class="material-icons">turned_in_not</i> 使用与条款-->
                    <!--</a>-->
                    <!--</li>-->
                </ul>
            </div>
        </div>
    </nav>
    <div class="wrapper wrapper-full-page">
        <div class="full-page register-page" filter-color="black" data-image="/img/register.jpeg">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <div class="card card-signup  animated slideInRight">
                            <h2 class="card-title text-center">立即加入</h2>
                            <div class="row">
                                <div class="col-md-5 col-md-offset-1">
                                    <div class="card-content">
                                        <div class="info info-horizontal">
                                            <!--<div class="testthis">-->
                                            <!--<img src="images/9.8.1.jpg">-->
                                            <!--</div>-->
                                            <img src="images/9.8.1.jpg">
                                            <h4 class="info-title">发现更精彩的世界</h4>
                                            <p class="description">
                                                hello IT world
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <!--<div class="social text-center">-->
                                    <!--<button class="btn btn-just-icon btn-round btn-twitter">-->
                                    <!--<i class="fa fa-twitter"></i>-->
                                    <!--</button>-->
                                    <!--<button class="btn btn-just-icon btn-round btn-dribbble">-->
                                    <!--<i class="fa fa-dribbble"></i>-->
                                    <!--</button>-->
                                    <!--<button class="btn btn-just-icon btn-round btn-facebook">-->
                                    <!--<i class="fa fa-facebook"> </i>-->
                                    <!--</button>-->
                                    <!--<button class="btn btn-just-icon btn-round btn-facebook">-->
                                    <!--<i class="fa fa-google"> </i>-->
                                    <!--</button>-->
                                    <!---->
                                    <!--</div>-->
                                    <form class="form" method="post" action="<c:url value = '/RegisterServlet'/>">
                                        <div class="card-content">
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="姓名" name="name" id="name" class="form-control" 　type="text"><span class="material-input"></span>${errors.username }</div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="学号" name="id" id="ID" class="form-control" 　type="text"><span class="material-input"></span>${errors.id }</div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td style="width: 8%;"><input id="male" type="radio" name="sex" value="男" checked/></td>
                                                            <td style="width: 64%;"><span class="material-input">男</span></td>
                                                            <td style="width: 8%;"><input id="female" type="radio" name="sex" value="女" /></td>
                                                            <td style="width: 20%;"><span class="material-input">女</span></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="院系" name="yuanxi" id="department" class="form-control" 　type="text"><span class="material-input"></span></div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="专业" name="major" id="profession" class="form-control" 　type="text"><span class="material-input"></span></div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="班级" name="class1" id="clazz" class="form-control" 　type="text"><span class="material-input"></span></div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="手机号码" name="phone" id="phone" class="form-control" 　type="text"><span class="material-input"></span></div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="QQ号码" name="qqNumber" id="qq" class="form-control" 　type="text"><span class="material-input"></span></div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="邮箱" name="email" id="email" class="form-control" 　type="text"><span class="material-input"></span></div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="密码" name="password" id="passwd" class="form-control" type="password"><span class="material-input"></span>${errors.passowrd }</div>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"></span>
                                                <div class="form-group is-empty"><input placeholder="确认密码" name="password1" id="repassword" class="form-control" type="password"><span class="material-input"></span></div>
                                            </div>
                                            <!-- If you want to add a checkbox to this form, uncomment this code -->
                                        </div>
                                        <div class="footer text-center">
                                            <input class="btn btn-primary btn-round" id="reg" type="submit"
                                                value = "注册"
                                                 class="ripple-container">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="full-page-background" style="background-image: url(images/9.8.1.jpg) "></div>
        </div>
    </div>
    <!-- js -->
    <script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/gt.js"></script>
</body>

</html>
<script>
$(document).ready(function() {
    //合作代理
    <!-- var domain = document.domain; -->
    <!-- if(domain=="sex.buding.info") -->
    <!-- { -->
    <!-- $("#code").val("hP7G7TULfm29NGAkIQZq13d5YzuxYggI"); -->
    <!-- $("#divcode").css("display","none"); -->
    <!-- }else if(domain=="kaka.buding.info") -->
    <!-- { -->
    <!-- $("#code").val("CxPgwGMe8aeok7vWFnhHffjLhpTmYpKN"); -->
    <!-- $("#divcode").css("display","none"); -->
    <!-- } -->
    $("#register_carte").addClass("active");

    function register() {
        code = $("#code").val();
        code = 0;
        if ((getCookie('code')) != '') {
            code = getCookie('code');
        }
        $.ajax({
            type: "POST",
            url: "/auth/register",
            dataType: "json",
            data: {
                email: $("#email").val(),
                name: $("#name").val(),
                passwd: $("#passwd").val(),
                repasswd: $("#repasswd").val(),
                wechat: '', //$("#wechat").val(),
                imtype: '0', //$("#imtype").val(),
                code: code
            },
            success: function(data) {
                if (data.ret == 1) {
                    swal({
                            title: "<span style='color: #9954bb; font-size:2rem; font-weight: 500'>" + data.msg + "</span>",
                            text: "<img src='picture/icon6.jpg' height='40' width='40'>",
                            imageUrl: "/assets/images/dotdot.jpg",
                            animation: "slide-from-top",
                            html: true,
                        },
                        function() {
                            window.setTimeout("location.href='/user/login.jsp'", 1200);
                        });
                } else {
                    swal({
                            title: "<span style='color: #9954bb; font-size:2rem; font-weight: 500'>" + data.msg + "</span>",
                            text: "<img src='picture/icon6.jpg' height='40' width='40'>",
                            imageUrl: "/assets/images/dotdot.jpg",
                            animation: "slide-from-top",
                            html: true,
                        },
                        function() {
                            setCookie('code', '', 0);
                            $("#code").val(getCookie('code'));
                        });
                }
            },
            error: function(jqXHR) {
                $("#msg-error").hide(10);
                $("#msg-error").show(100);
                $("#msg-error-p").html("发生错误：" + jqXHR.status);
                document.getElementById("tos").disabled = false;
            }
        });
    }
    $("html").keydown(function(event) {
        if (event.keyCode == 13) {
            $("#tos_modal").modal();
        }
    });


    $("#reg").click(function() {


        register();
    });
})
</script>
<!-- 不知道什么JS -->
<script>
function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return "";
}


function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}


function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i].trim();
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}


if (getQueryVariable('code') != '') {
    setCookie('code', getQueryVariable('code'), 30);
    window.location.href = '/register.jsp';
}


if ((getCookie('code')) != '') {
    $("#code").val(getCookie('code'));
}
</script>