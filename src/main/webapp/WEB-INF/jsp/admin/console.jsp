<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/8
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Blog后台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/layuiadmin/style/admin.css" media="all">
</head>

<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">

        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">
                    新增访问量
                    <span><i class="layui-inline layui-icon layui-icon-release" style="color:#1e9fff"></i></span>
                </div>
                <div class="layui-card-body layuiadmin-card-list">
                    <p class="layuiadmin-big-font">2</p>
                    <p>
                        总计访问量
                        <span class="layuiadmin-span-color">755<i
                                class="layui-inline layui-icon layui-icon-flag"></i></span>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">
                    总文章数
                    <i class="layui-icon layui-icon-list" style="font-size:25px;color:#1e9fff"></i>
                </div>
                <div class="layui-card-body layuiadmin-card-list">
                    <p class="layuiadmin-big-font">${articleCount}</p>
                    <p>
                        <a lay-href="<%=request.getContextPath()%>/admin/article/all">
                            查看所有
                            <span class="layuiadmin-span-color"><i
                                    class="layui-inline layui-icon layui-icon-down"></i></span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">
                    总评论数
                    <i class="layui-icon layui-icon-reply-fill" style="color:#1e9fff"></i>
                </div>
                <div class="layui-card-body layuiadmin-card-list">

                    <p class="layuiadmin-big-font">${commentCount}</p>
                    <p>
                        <a lay-href="<%=request.getContextPath()%>/admin/comment/all">
                            查看所有
                            <span class="layuiadmin-span-color"><i
                                    class="layui-inline layui-icon layui-icon-down"></i></span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">
                    总标签数
                    <i class="layui-icon layui-icon-note" style="color:#1e9fff"></i>
                </div>
                <div class="layui-card-body layuiadmin-card-list">

                    <p class="layuiadmin-big-font">${tagCount}</p>
                    <p>
                        <a lay-href="<%=request.getContextPath()%>/admin/article/tag">
                            查看所有
                            <span class="layuiadmin-span-color"><i
                                    class="layui-inline layui-icon layui-icon-down"></i></span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-sm4">
            <div class="layui-card">
                <div class="layui-card-header">最新评论</div>
                <div class="layui-card-body">
                    <ul class="layuiadmin-card-status layuiadmin-home2-usernote">

                        <c:forEach items="${commentList}" var="comment">
                            <c:if test="${comment.commentPid == 0}">

                                <li>
                                    <h3> <img src="<%=request.getContextPath()%>/static/pic/comment/default.jpg" class="layui-nav-img">${comment.commentName}</h3>
                                    <p>${comment.commentContent}</p>
                                    <span><fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                                    <button type="button" data-index="${comment.id}" id="reply"
                                            class="layui-btn layui-btn-xs layuiadmin-reply">回复</button>
                                </li>

                            </c:if>
                        </c:forEach>

                    </ul>
                </div>
            </div>
        </div>

        <div class="layui-col-sm8">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-sm12">
                    <div class="layui-card">
                        <div class="layui-card-header">最新发布文章<i class="layui-icon layui-icon-file-b"
                                                                style="font-size: 20px;"></i>
                        </div>
                        <div class="layui-card-body">
                            <table class="layui-table layuiadmin-page-table">
                                <colgroup>
                                    <col width="300">
                                    <col width="150">
                                    <col width="100">
                                    <col width="150">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>标题</th>
                                    <th>文章类型</th>
                                    <th style="text-align:center;">发布类型</th>
                                    <th style="text-align:center;">发布时间</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${articleList}" var="article">

                                    <tr>
                                        <td>
                                            <a href="#" target="_blank">
                                                ${article.title}
                                            </a>
                                        </td>
                                        <td>

                                            <c:if test="${article.articleType == 1}">
                                                <span class="layui-badge layui-bg-green">转载</span>
                                            </c:if>
                                            <c:if test="${article.articleType == 0}">
                                                <span class="layui-badge layui-bg-cyan">原创</span>
                                            </c:if>

                                        </td>
                                        <td align="center">

                                            <c:if test="${article.issueType == 1}">
                                                <span class="layui-badge layui-bg-green">正文</span>
                                            </c:if>
                                            <c:if test="${article.issueType == 0}">
                                                <span class="layui-badge layui-bg-cyan">草稿</span>
                                            </c:if>

                                        </td>
                                        <td align="center"><i class="layui-icon layui-icon-log"> </i>
                                            <fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                        </td>
                                    </tr>

                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="layui-col-sm12">
                    <div class="layui-card">
                        <div class="layui-card-header">最新日志<i class="layui-icon layui-icon-notice"
                                                              style="font-size: 20px;"></i> </div>
                        <div class="layui-card-body">
                            <div class="layui-row layui-col-space15">
                                <div class="layui-col-sm12">
                                    <table class="layui-table layuiadmin-page-table">
                                        <colgroup>
                                            <col width="300">
                                            <col width="150">
                                            <col width="100">
                                            <col width="150">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>详细内容</th>
                                            <th style="text-align:center;">类型</th>
                                            <th style="text-align:center;">ip</th>
                                            <th style="text-align:center;">时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${logList}" var="log" >

                                            <tr>
                                                <td>${log.logDetail}</td>
                                                <td align="center">${log.logType}</td>
                                                <td align="center">${log.ip}</td>
                                                <td align="center"><i class="layui-icon layui-icon-log"> </i>
                                                    <fmt:formatDate value="${log.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                            </tr>

                                        </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<script src="<%=request.getContextPath()%>/static/editor/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '<%=request.getContextPath()%>/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'useradmin', 'table'], function () {
        var $ = layui.$,
            form = layui.form,
            table = layui.table;
    });
</script>



<script>
    $("[id=reply]").on("click", function () {
        var id = $(this).attr('data-index')
        var str = "<%=request.getContextPath()%>/admin/comment/addreply/" + id;
        var c = $(this).parent().parent();
        layer.open({
            type: 2,
            title: '回复评论',
            content: str,
            maxmin: true,
            async: false,
            area: ['480px', '350px'],
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                var comment = window["layui-layer-iframe" + index].callbackdata();
                console.log(comment);
                $.ajax({
                    url: '<%=request.getContextPath()%>/admin/comment/add',
                    data: comment,
                    cache: false,
                    dataType: "json",
                    success: function (data) {
                        if (data.state == 1) {
                            layer.alert("回复成功", {icon: 1});
                        } else
                            layer.msg("回复失败");
                    }
                });
                layer.close(index);
            }
        });
    });
</script>
</body>
</html>

