'use strict';

jQuery(document).ready(function($) {
	//分类查询
	$('.search-type').click(function () {  
        $(".newlist").hide();	 		 
		$('.search-type').removeClass("active");
		$(this).addClass("active");
		var n = $(this).attr('data-index');

        var txt="";
        if(n==1){
            txt="请输入项目名称关键字，多个关键字用空格分隔。(如：广东 海上风电)";
        }else if(n==3){
            txt="请输入业主单位名称关键字，多个关键字用空格分隔。(如：中国石油化工)";
        }else if(n==4){
            txt="请输入设计院名称关键字，多个关键字用空格分隔。(如：华东 建筑)";
        }else if(n==5){
            txt="请输入施工单位名称关键字，多个关键字用空格分隔。(如：上海 电力工程)";
        }else if(n==7){
            txt="请输入所需设备关键字，多个关键字用空格分隔。(如：火灾报警 视频监控)";
        }
        $('#searchkey').attr('placeholder',txt);
                
		$("#index").val(n);
	}); 



    //注册提交         
    $('#register').click(function(){
        var reg_uname = $("#reg_uname").val();
        var reg_pwd = $("#reg_pwd").val();
        var reg_repwd = $("#reg_repwd").val();
        var verycode = $("#verycode").val();

        if(reg_uname==''){ err($("#reg_uname"),'请输入您的手机号'); return false; }
        if(reg_uname.length<11){ err($("#reg_uname"),'手机号错误'); return false; }
        if(verycode==''){ err($("#verycode"),'请输入手机验证码'); return false; }
        if(verycode.length!=4){ err($("#verycode"),'手机验证码错误'); return false; }        
        if(reg_pwd==''){ err($("#reg_pwd"),'请输入登录密码'); return false; }
        if(reg_pwd.length<6){ err($("#reg_pwd"),'密码不能少于6位'); return false; }
        if(reg_repwd==''){ err($("#reg_repwd"),'请再次输入登录密码'); return false; }
        if(reg_pwd!=reg_repwd){ err($("#reg_repwd"),'两次密码不一致'); return false; }

        //保存资料
        var targetUrl = $("#regform").attr("action");    
        var data = $("#regform").serialize();
        $.ajax({ 
            type:'post',  
            url:targetUrl, 
            cache: false,
            data:data,
            dataType:'json', 
            success:function(data){      
                if(data.ret == 1){                    
                    //关闭注册层
                    $('#regdiv').fadeOut(100);
                    $('.theme-popover_reg').slideUp(200);
                    
                    //弹出注册成功层
                    $('#deviceisrooteddiv').fadeIn(100);
                    $('.theme-popover_deviceisrooted').slideDown(200);

                    //注册成功
                    regok(data.userid);

                    if(data.cate){
                        var datalength = data.cate.length;
                        if(datalength>0){
                            var divall ='';
                            for(let i=0; i<datalength; i++){
                                 divall+="<div style='display:block;'><p style='margin:0;'>"+data.cate[i].name+"行业工程项目信息(<a href='/project.html?cate[]="+data.cate[i].id+"'><span id='datacount'>"+data.cate[i].pronum+"</span>条</a>)</p></div><div style='display:block; border:1px dashed #e2e0e0;'></div>";
                            }                                          
                            $("#datacatecount").html(divall);
                        }
                    }

                    return true;
                }else{
                    layer.msg(data.msg);                    
                    return false;
                }
            },
        }); 
    })

    //注册成功落地页
    function regok(userid){
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "https://hm.baidu.com/hm.js?d2634fb106dc720564524e04dfd88bec";
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();

        $.ajax({ type:'post', url:'/reg/regok/userid/'+userid+'.html', 
            success:function(data){
            },
        });         
    }

    //登录提交         
    $('#loginsubmit').click(function(){
        var login_uname = $("#login_uname").val();
        var login_pwd = $("#login_pwd").val();
        var login_sign = $("#login_sign").val();
        var indexurl = $("#indexurl").val();

        if(login_uname==''){ err($("#login_uname"),'请输入您的登录名'); return false; }
        //if(login_uname.length<11){ err($("#login_uname"),'手机号错误'); return false; }
        if(login_pwd==''){ err($("#login_pwd"),'请输入登录密码'); return false; }
        if(login_pwd.length<6){ err($("#login_pwd"),'密码错误'); return false; }
        if(login_sign==''){ err($("#login_sign"),'请输入验证码'); return false; }
        if(login_sign.length!=4){ err($("#login_sign"),'验证码错误'); return false; }

        //保存资料
        var targetUrl = $("#loginform").attr("action");    
        var data = $("#loginform").serialize();
        $.ajax({ 
            type:'post',  
            url:targetUrl, 
            cache: false,
            data:data,
            dataType:'json', 
            success:function(data){      
                if(data.ret == 1){
                    layer.msg("登录成功~");
                    setTimeout(function(){
                        if(indexurl!=''){
                            window.location.href="https://www.china0001.com.cn"+indexurl;
                        }else{
                            window.location.href="https://www.china0001.com.cn/project.html";
                        }
                    }, 1000);
                    return true;
                }else{
                    layer.msg(data.msg);
                    $('#sign1').attr('src', '/index/sign.html?t='+(new Date().getTime()));
                    return false;
                }
            },
        }); 
    })

    //申请试用 
    $('#testsubmit').click(function(){
        var test_uname = $("#test_uname").val();
        var test_company = $("#test_company").val();
        var test_truename = $("#test_truename").val();
        var test_position = $("#test_position").val();
        var test_email = $("#test_email").val();
        var test_verycode = $("#test_verycode").val();

        if(test_uname==''){ err($("#test_uname"),'请输入您的手机号'); return false; }
        if(test_uname.length<11){ err($("#test_uname"),'手机号错误'); return false; }
        if(test_verycode==''){ err($("#test_verycode"),'请输入手机验证码'); return false; }
        if(test_verycode.length!=4){ err($("#test_verycode"),'手机验证码错误'); return false; }

        if(test_company==''){ err($("#test_company"),'请输入您的公司名称'); return false; }
        //if(test_company.length<2){ err($("#test_company"),'公司名称错误'); return false; }
        if(test_truename==''){ err($("#test_truename"),'请输入联系人姓名'); return false; }
        //if(test_truename.length<2){ err($("#test_truename"),'联系人姓名错误'); return false; }
        
        if(test_position==''){ err($("#test_position"),'请输入联系人职位名称'); return false; }        
        //if(test_position.length<2){ err($("#test_position"),'联系人职位名称错误'); return false; }
        if(test_email==''){ err($("#test_email"),'请输入联系人Email地址'); return false; }
        //if(test_email.length<4){ err($("#test_email"),'Email地址错误'); return false; }  
              


        //保存资料
        var targetUrl = $("#testform").attr("action");    
        var data = $("#testform").serialize();
        $.ajax({ 
            type:'post',  
            url:targetUrl, 
            cache: false,
            data:data,
            dataType:'json', 
            success:function(data){      
                if(data.ret == 1){
                    layer.msg("恭喜您申请试用成功，客服人员会在尽快与您联系并开通试用账户~",{time:5*1000},function() {
                        //关闭试用层
                        $('#testdiv').fadeOut(100);
                        $('.theme-popover_test').slideUp(200);
                        
                        window.location.href="/project/index/userid="+data.userid;
                    });

                   /*
                   layer.msg("恭喜您申请试用成功，客服人员会在尽快与您联系并开通试用账户~");
                    setTimeout(function(){
                        //关闭试用层
                        $('#testdiv').fadeOut(100);
                        $('.theme-popover_test').slideUp(200);
                    }, 3000);
                    */
                   
                    return true;
                }else{
                    layer.msg(data.msg);
                    $('#sign3').attr('src', '/index/sign.html?t='+(new Date().getTime()));
                    return false;
                }
            },
        }); 
    })

    //完善资料 
    $('#testperfectinformation').click(function(){
        var test_companyl = $("#reg_company").val();
        var test_truenamel = $("#reg_truename").val();
        var test_positionl = $("#reg_position").val();

        if(test_companyl==''){ err($("#test_companyl"),'请输入您的公司名称'); return false; }
        if(test_companyl.length<2){ err($("#test_companyl"),'公司名称错误'); return false; }
        if(test_truenamel==''){ err($("#test_truenamel"),'请输入联系人姓名'); return false; }
        if(test_truenamel.length<2){ err($("#test_truenamel"),'联系人姓名错误'); return false; }
        
        if(test_positionl==''){ err($("#test_positionl"),'请输入联系人职位名称'); return false; }        
        if(test_positionl.length<2){ err($("#test_positionl"),'联系人职位名称错误'); return false; }
      
        // //保存资料
        var targetUrl = $("#perfect_informationform").attr("action");    
        var data = $("#perfect_informationform").serialize();
        $.ajax({ 
            type:'post',  
            url:targetUrl, 
            cache: false,
            data:data,
            dataType:'json', 
            success:function(data){      
                if(data.ret == 1){
                    layer.msg("您的预约信息已经收到，我们工作人员会尽快联系您！");
                    $('#perfect_informationdiv').fadeOut(100);
                    $('.theme-popover_perfectinformation').slideUp(200);
                    setTimeout(function(){
                        //跳转至项目列表
                        window.location.href="/project.html";
                    }, 5000);
                   
                    return true;
                }
                else{
                    layer.msg(data.msg);
                    return false;
                }
            },
        }); 
    })

    //提交免费电话
    $('#submitphone').click(function(){
        var phone = $("#phone").val();
        if(phone==''){ err($("#phone"),'请输入您的电话号码'); return false; }
        if(phone.length<6){ err($("#phone"),'电话号码错误'); return false; }

        //保存电话号码
        var targetUrl = $("#submitphoneform").attr("action");    
        var data = $("#submitphoneform").serialize();
        $.ajax({ 
            type:'post',  
            url:targetUrl, 
            cache: false,
            data:data,
            dataType:'json', 
            success:function(data){      
                if(data.ret == 1){
                    layer.msg("提交成功，客服人员会在尽快给您回电，请保持你的电话畅通~");                    
                    return true;
                }else{
                    layer.msg(data.msg);                    
                    return false;
                }
            },
        }); 
    })

    //点击次数
    $(".view").on('click', function(){
        var dataid = this.id;        
        $.ajax({
            type: "post",
            dataType: "json",
            data: '',
            url: "/ajax/checkviewnum.html",
            success: function(data) {
                //正常可查看
                if(data.ret == 1){
                    $('#'+dataid).hide();
                    $('#'+dataid+'_data').show();
                    return false;
                //次数已用完
                }else if(data.ret == 400){
                    $('#meansdiv').fadeIn(100);
                    $('.theme-popover_means').slideDown(200);
                    // $('#modal_upmember').modal({'closeViaDimmer': false})
                    // return false;
                //异常报错
                }else{
                    layer.msg(data.msg);
                    return false;
                }
            },
            error: function() {
                layer.msg('请求失败，稍后再试',function(){});
            },
        });
    })


    //弹出提示信息并设置焦点
    function err(obj,txt){
        layer.msg(txt);
        obj.focus();
    }


    // 弹出登录层
    $('#login').click(function(){
        $('.theme-popover-mask').fadeIn(100);
        $('.theme-popover').slideDown(200);
    })

    //关闭登录层
    $('.close').click(function(){
        $('.theme-popover-mask').fadeOut(100);
        $('.theme-popover').slideUp(200);
    })

    // 弹出注册层
    $('#reg').click(function(){
        $('#regdiv').fadeIn(100);
        $('.theme-popover_reg').slideDown(200);
    })

    //关闭注册层
    $('.close').click(function(){
        $('#regdiv').fadeOut(100);
        $('.theme-popover_reg').slideUp(200);
    })
    //关闭免费注册
    $('.close').click(function(){
        $('#regdiv').fadeOut(100);
        $('.theme-popover_register').slideUp(200);
    })
    //没有机会提示
    $('.close').click(function(){
        $('#meansdiv').fadeOut(100);
        $('.theme-popover_means').slideUp(200);
    }) 
    //完善资料   
    $('.close').click(function(){
        $('#perfect_informationdiv').fadeOut(100);
        $('.theme-popover_perfectinformation').slideUp(200);
    })


    // 弹出试用层
    $('#applitest').click(function(){
        $('#testdiv').fadeIn(100);
        $('.theme-popover_test').slideDown(200);
    })


    //关闭试用层
    $('.close').click(function(){
        $('#testdiv').fadeOut(100);
        $('.theme-popover_test').slideUp(200);
    })

    //免费注册成功提示
    $('.close').click(function(){
        $('#deviceisrooteddiv').fadeOut(100);
        $('.theme-popover_deviceisrooted').slideUp(200);
    })
    //点击弹出层上的注册按钮
    $('#reg_div').click(function(){
        $('.theme-popover-mask').fadeOut(100);
        $('.theme-popover').slideUp(200);

        $('#regdiv').fadeIn(100);
        $('.theme-popover_reg').slideDown(200);
    })

    //去登录
    $('#gologin').click(function(){
        $('#testdiv').fadeOut(100);
        $('.theme-popover_test').slideUp(200);

        $('.theme-popover-mask').fadeIn(100);
        $('.theme-popover').slideDown(200);
    })

    //点击弹出层上的去登录按钮
    $('#login_div').click(function(){
        $('#regdiv').fadeOut(100);
        $('.theme-popover_reg').slideUp(200);

        $('.theme-popover-mask').fadeIn(100);
        $('.theme-popover').slideDown(200);
    }) 

    //点击注册层上的申请试用按钮
    $('#reg-test').click(function(){
        $('.theme-popover-mask').fadeOut(100);
        $('.theme-popover').slideUp(200);

        $('#testdiv').fadeIn(100);
        $('.theme-popover_test').slideDown(200);
    })

    //完善资料的按钮
    $('#perfect_information').click(function(){
        $('.meansdiv').fadeOut(100);
        $('.theme-popover_means').slideUp(200);

        $('#perfect_informationdiv').fadeIn(100);
        $('.theme-popover_perfectinformation').slideDown(200);
    })

    //20秒极速注册
    $('#reg-register').click(function(){
        $('.theme-popover-mask').fadeOut(100);
        $('.theme-popover').slideUp(200);

        $('#regdiv').fadeIn(100);
        $('.theme-popover_reg').slideDown(200);
    }) 

    //免费注册成功后提示成功页面  跳转到登录页面
    $('#deviceisrootedlogin').click(function(){
        $('.theme-popover-mask').fadeOut(100);
        $('.theme-popover_deviceisrooted').slideUp(200);

        $('.theme-popover-mask').fadeIn(100);
        $('.theme-popover').slideDown(200);
    }) 

})