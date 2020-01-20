<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/29
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer-bg" style="background-image:url(<%=request.getContextPath()%>${backgroundImage})">
    <div class="layout" id="footer">
        <div class="copyright">
            &copy;2019 - future By cheers
        </div>
        <div class="framework-info">
            <span>醉后不知天在水，满船清梦压星河</span>
        </div>
    </div>
</footer>

<i class="fa fa-arrow-up" id="go-up" aria-hidden="true"></i>
<section class="rightside" id="rightside">
    <i class="fa fa-moon nightshift_pc kk" id="nightshift_pc"></i>
    <div class="progress_show">
        <span class="progress-num">0</span>
    </div>
</section>

<div class="search-dialog" id="local-search">
    <div class="search-dialog__title" id="local-search-title">
        本地搜索
    </div>
    <div id="local-input-panel">
        <div id="local-search-input">
            <div class="local-search-box">
                <input class="local-search-box--input" placeholder="搜索文章" onkeyup="searchWord(this)">
            </div>
        </div>
    </div>
    <hr>
    <div id="local-search-results">
        <div id="local-hits">
            <div class="search-result-list">
                <div id="display">
                    <!-- 			显示查询的结果 -->
                </div>
            </div>
        </div>
    </div>
    <span class="search-close-button">
               <i class="fa fa-times">
               </i>
          </span>
</div>
<div class="search-mask"></div>

<script src="<%=request.getContextPath()%>/static/js/anime.min.js"></script>
<script src="<%=request.getContextPath()%>/static/jquery/jquery.js"></script>
<script src="<%=request.getContextPath()%>/static/js/jquery.fancybox.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/velocity.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/velocity.ui.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/utils.js"></script>
<script src="<%=request.getContextPath()%>/static/js/fancybox.js"></script>
<script src="<%=request.getContextPath()%>/static/js/sidebar.js"></script>
<script src="<%=request.getContextPath()%>/static/js/fireworks.js"></script>
<script src="<%=request.getContextPath()%>/static/js/transition.js"></script>
<script src="<%=request.getContextPath()%>/static/js/scroll.js"></script>
<script src="<%=request.getContextPath()%>/static/js/nightshift.js"></script>
<script src="<%=request.getContextPath()%>/static/js/head.js"></script>
<script src="<%=request.getContextPath()%>/static/js/local-search.js"></script>
<script async="" src="<%=request.getContextPath()%>/static/js/busuanzi.pure.mini.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.flexText.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
<script type="text/javascript">
    function overFn(obj) { //鼠标在上面
        $(obj).css("background", "#F0F8FF");
    }

    function outFn(obj) { //鼠标离开
        $(obj).css("background", "white");
    }

    function clickFn(obj) { //鼠标点击
        $("#display").val($(obj).html());
    }
    //上面的是提示框的css代码，下面的是ajax获取代码
    function searchWord(obj) {
        //1、获得输入框的输入的内容
        var word = $(obj).val();
        //2、根据输入框的内容去数据库中模糊查询---List<Product>
        var content = "";
        $.post(
            "<%=request.getContextPath()%>/search", {
                title: word
            },
            function (result) {

                if (result.data.length > 0) {
                    for (var i = 0; i < result.data.length; i++) {
                        content += '<div class="search-result-lis " onclick=' + clickFn(this) +
                            'onmouseover=' + overFn(this) + ' onmouseout=' + outFn(this) +
                            '><div class="local-search__hit-item"><a href=<%=request.getContextPath()%>/detail/' + result.data[i].id
                                 + ' class="search-result-title">	' + result.data[i].title + '</a></div>';
                    }
                    $("#display").html(content);
                    $("#display").css("display", "block");
                }else {
                    $("#display").css("display", "none");
                }
            },
            "json"
        );
        if (obj.value.length == 0) { //判断输入框是否为空，如果为空则隐藏提示区域
            console.log("111");
            $("#display").css("display", "none");
        }
    }
</script>
