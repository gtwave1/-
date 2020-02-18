
$(document).ready(function(){
    var $backToTop = $(".back-to-top");
    var $backTop = $(".back-to-top-index");
    /* 隐藏回顶部按钮 */
    /*$backToTop.css("opacity", 0);
    $backTop.css("opacity", 0);
    /* 监听浏览器滚动条 */
    /*$(window).on('scroll', function() {
        if ($(this).scrollTop() > 100) { // 返回顶部按钮将在用户向下滚动100像素后出现 
            $backToTop.css("opacity", 1);
            $backTop.css("opacity", 1);
        } else {
            $backToTop.css("opacity", 0);
            $backTop.css("opacity", 0);
        }
    });*/
    
    /* 点击返回顶部*/
    $backToTop.on('click', function(e) {
        $("html, body").animate({scrollTop: 0}, 500);
    });
    $backTop.on('click', function(e) {
        $("html, body").animate({scrollTop: 0}, 500);
    });
})