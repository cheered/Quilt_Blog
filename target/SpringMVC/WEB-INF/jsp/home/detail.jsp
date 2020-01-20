<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/29
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">

<head>
   
    <jsp:include page="common/head.jsp"></jsp:include>

</head>

<body>

<canvas class="fireworks"></canvas>
<i class="fa fa-arrow-right" id="toggle-sidebar" aria-hidden="true"></i>
<div id="sidebar">
    <div class="toggle-sidebar-info text-center">
        <span data-toggle="Toggle article">Toggle site</span>
        <hr />
    </div>
    <div class="sidebar-toc">
        <div class="sidebar-toc__title">
            Catalog
        </div>
        <div class="sidebar-toc__progress">
            <span class="progress-notice">You've read</span>
            <span class="progress-num">0</span>
            <span class="progress-percentage">%</span>
            <div class="sidebar-toc__progress-bar"></div>
        </div>
        <div class="sidebar-toc__content">
            <ol class="toc">

                <c:forEach items="${chapterList}" var="chapter">
                    <li class="toc-item toc-level-2"><a class="toc-link" href="#${chapter.chapterId}"><span
                            class="toc-number">${chapter.chapterNum}.</span> <span class="toc-text">${chapter.chapterName}</span></a>
                    </li>
                </c:forEach>

            </ol>
        </div>
    </div>
    <div class="author-info hide">




        <div class="author-info__avatar text-center">
            <img src="<%=request.getContextPath()%>${user.headPic}" width="100px" height="100px" />
        </div>
        <div class="author-info__name text-center">
            ${user.userNickname}
        </div>
        <div class="author-info__description text-center">
            ${user.userSignature}
        </div>

        <div class="follow-button">
            <a href="https://github.com/cheered">Follow Me</a>
        </div>
        <hr />
        <div class="author-info-articles">
            <a class="author-info-articles__archives article-meta" href="<%=request.getContextPath()%>/archives"><span
                    class="pull-left">Articles</span><span class="pull-right">${articleCount}</span></a>
            <a class="author-info-articles__tags article-meta" href="<%=request.getContextPath()%>/tags"><span class="pull-left">Tags</span><span
                    class="pull-right">${tagCount}</span></a>
            <a class="author-info-articles__categories article-meta" href="<%=request.getContextPath()%>/categories"><span
                    class="pull-left">Categories</span><span class="pull-right">${categoryCount}</span></a>
        </div>
        <hr />

        <div class="author-info-links">
            <div class="author-info-links__title text-center">
                Links
            </div>

            <c:forEach items="${userTagList}" var="userTag">

                <a class="author-info-links__name text-center" href="#">${userTag}</a>

            </c:forEach>


        </div>
    </div>
</div>


<div id="content-outer">
    <div id="top-container" style="background-image:url(<%=request.getContextPath()%>/static/images/index/1555489420622.jpg)">

        <div id="page-header">
            <span class="pull-left"><strong></h2><a href="<%=request.getContextPath()%>/">cheers の Blog</a></strong></span>
            <i class="fa fa-bars toggle-menu pull-right" aria-hidden="true"></i>
            <span class="pull-right menus">
                    <!-- 	<input type="search" class="site-page social-icon search"  placeholder="搜索"> -->

                    <a class="site-page social-icon search"><i class="fa fa-search"></i><span> 搜索</span></a>
                    <a class="site-page" href="<%=request.getContextPath()%>/"><i class="menu-item-icon fa fa-fw fa-home"></i>首页</a>
                    <a class="site-page" href="<%=request.getContextPath()%>/archives"><i class="menu-item-icon fa fa-fw fa-archive"></i>归档</a>
                    <a class="site-page" href="<%=request.getContextPath()%>/tags"><i class="menu-item-icon fa fa-fw fa-tags"></i>标签</a>
                    <a class="site-page" href="<%=request.getContextPath()%>/categories"><i class="menu-item-icon fa fa-fw fa-th"></i>分类</a>
                    <a class="site-page" href="<%=request.getContextPath()%>/about"> <i
                            class="menu-item-icon fa fa-fw fa-user fa-fw"></i>关于</a></span>
        </div>
        <div id="post-info">
            <div id="post-title">
                ${articleWithBLOBs.title}
            </div>
            <div id="post-meta">
                <time class="post-meta__date"><i class="fa fa-calendar" aria-hidden="true"></i>
                    <fmt:formatDate value="${articleWithBLOBs.createTime}" pattern="yyyy-MM-dd" /> </time>
                <span class="post-meta__separator">|</span>

                <i class="fa fa-inbox post-meta__icon" aria-hidden="true"></i>

                <strong>

                    <c:forEach items="${categoryList}" var="category">

                        <a class="post-meta__categories" href="<%=request.getContextPath()%>/category/timeline/${category.id}">${category.categoryName}&nbsp;</a>

                    </c:forEach>

                </strong>

                <div class="post-meta-wordcount">
                    <span>阅读总计: </span>
                    <span class="word-count">${articleWithBLOBs.viewCount}</span>
                    <span class="post-meta__separator">|</span>
                    <span>评论总数: ${articleWithBLOBs.commentCount}</span>
                </div>
            </div>
        </div>
    </div>
    <div class="layout" id="content-inner">
        <article id="post">
            <div class="article-container" id="post-content">

                ${articleWithBLOBs.htmlContent}

            </div>
        </article>



        <div class="post-copyright">
            <div class="post-copyright__author">
                <span class="post-copyright-meta">作者: </span>
                <span class="post-copyright-info">${user.userNickname}</span>
            </div>
            <div class="post-copyright__type">
                <span class="post-copyright-meta">文章类型: </span>
                <span class="post-copyright-info">

                        <c:if test="${articleWithBLOBs.articleType == 0}">原创</c:if>
                        <c:if test="${articleWithBLOBs.articleType == 1}">转载</c:if>

                    </span>
            </div>
            <div class="post-copyright__notice">
                <span class="post-copyright-meta">Copyright Notice: </span>
                <span class="post-copyright-info">All articles in this blog are licensed under <a
                        href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a> unless stating
                        additionally.</span>
            </div>
        </div>


        <div class="post-meta__tag-list">

            <c:forEach items="${tagList}" var="tag">

                <a class="post-meta__tags" href="<%=request.getContextPath()%>/tag/timeline/${tag.id}">${tag.tagName}</a>

            </c:forEach>

        </div>

        <div class="addthis_inline_share_toolbox pull-right"></div>


        <script src="<%=request.getContextPath()%>/static/jquery/jquery.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/comment.css">
        <div class="commentAll">
            <!--评论区域 begin-->
            <div class="reviewArea clearfix">
                <form id="myForm" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="articleId" value="${articleWithBLOBs.id}">
                    <textarea class="content comment-input" name="commentContent"
                              placeholder="Please enter a comment&hellip;"></textarea>
                    <img src="<%=request.getContextPath()%>/static/pic/comment/default.jpg" alt="" width="45" height="45"
                         style="border-radius: 50%" id="prevView">
                    <%--<input type="file" name="commentAvatarImage" id="" value="default.jpg" onchange="prev(this)" />--%>
                    <a href="javascript:myadd();" class="plBtn" id="review">评论</a>
                    <div class="inputbox">
                        姓名:&nbsp;<input type="text" name="commentName" id="cname"
                                        class="bname" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        邮箱:&nbsp;<input type=”text" name="commentEmail" class="bemail" />
                    </div>
                </form>
            </div>
            <!--评论区域 end-->
            <!--回复区域 begin-->
            <div class="comment-show">

                <c:forEach items="${commentList}" var="comment">
                    <c:if test="${comment.commentPid== 0}">
                        <div class="comment-show-con clearfix">
                            <div class="comment-show-con-img pull-left"><img src="<%=request.getContextPath()%>${comment.headPic}" alt=""
                                                                             class="comment-avatar"></div>
                            <div class="comment-show-con-list pull-left clearfix">
                                <div class="pl-text clearfix">
                                    <a class="comment-size-name">${comment.commentName} : </a>
                                    <span class="my-pl-con">&nbsp;${comment.commentContent}</span>
                                </div>
                                <div class="date-dz">
                                    <span class="date-dz-left pull-left comment-time">
                                        <fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                                    <div class="date-dz-right pull-right comment-pl-block">

                                        <a href="javascript:;" class="date-dz-z pull-left" data-index="${comment.id}"><i
                                                class="fa fa-heart"></i>&nbsp;赞 (<i class="z-num">2</i>)</a>

                                    </div>
                                </div>
                                <div class="hf-list-con"></div>
                            </div>

                            <c:forEach items="${commentList}" var="commentChild">
                                <c:if test="${commentChild.commentPid == comment.id}">
                                    <div style="margin-left:2rem">

                                        <div class="comment-show-con-img pull-left"><img src="<%=request.getContextPath()%>${commentChild.headPic}"
                                                                                         alt="" class="comment-avatar"></div>
                                        <div class="comment-show-con-list pull-left clearfix">
                                            <div class="pl-text clearfix">
                                                <span><a class="btn">博主</a>&nbsp; : </span>

                                                <span class="my-pl-con">&nbsp;${commentChild.commentContent}</span>
                                            </div>
                                            <div class="date-dz">
                                                <span class="date-dz-left pull-left comment-time">
                                                     <fmt:formatDate value="${commentChild.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </span>
                                                <div class="date-dz-right pull-right comment-pl-block">
                                                    <a href="javascript:;" class="date-dz-z pull-left" data-index="${commentChild.id}"><i
                                                            class="fa fa-heart"></i>&nbsp;赞 (<i class="z-num">0</i>)</a>
                                                </div>
                                            </div>
                                            <div class="hf-list-con"></div>
                                        </div>
                                    </div>

                                </c:if>
                            </c:forEach>

                        </div>
                    </c:if>

                </c:forEach>

            </div>

            <script>
                function myadd() {
                    var content = $(".content").val();
                    var name = $("#cname").val();
                    var temp = $("#no_comment").val();
                    if (content && name) {
                        $.ajax({
                            type: "POST",
                            url: '<%=request.getContextPath()%>/admin/comment/add',
                            data: new FormData($("#myForm")[0]),
                            cache: false,
                            async: false,
                            processData: false,
                            contentType: false,
                            dataType: "json",
                            success: function (data) {
                                if (data.state == 1) {
                                    layer.alert("添加成功", {icon: 1},function () {
                                        location.reload();
                                    });

                                } else
                                    layer.alert("添加失败", {icon: 5});
                            }
                        });
                    } else {
                        layer.msg("内容跟名称不能为空");
                    }

                }

                // $('.comment-show').on('click','.date-dz-z',function(){
                $(document).on('click', '.date-dz-z', function () {
                    var zNum = $(this).find('.z-num').html();
                    if ($(this).is('.date-dz-z-click')) {
                        zNum--;
                        $(this).removeClass('date-dz-z-click red');
                        $(this).find('.z-num').html(zNum);
                        $(this).find('.date-dz-z-click-red').removeClass('red');
                    } else {
                        zNum++;
                        $(this).addClass('date-dz-z-click');
                        $(this).find('.z-num').html(zNum);
                        $(this).find('.date-dz-z-click-red').addClass('red');
                    }
                    $.post('/update_like', {
                        commentId: $(this).attr('data-index'),
                        commentLikeCount: zNum
                    }, 'json');
                });


                // 	预览图片
                function prev(event) {
                    //获取展示图片的区域
                    console.log("tttt");
                    var img = document.getElementById("prevView");
                    //获取文件对象
                    let file = event.files[0];
                    //获取文件阅读器
                    let reader = new FileReader();
                    reader.readAsDataURL(file);
                    reader.onload = function () {
                        //给img的src设置图片url
                        img.setAttribute("src", this.result);
                    }
                }
            </script>
        </div>
    </div>
</div>

    <jsp:include page="common/foot.jsp"></jsp:include>

</body>

</html>
