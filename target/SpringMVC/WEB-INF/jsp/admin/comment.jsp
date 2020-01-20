<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/8
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link id="layuicss-layer" rel="stylesheet"
          href="http://www.sincenovember.top/static/layuiadmin/layui/css/modules/layer/default/layer.css?v=3.1.1"
          media="all">
</head>

<body layadmin-themealias="default">

<!--    列表 -->
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>用户评论</legend>
            <p style="text-indent:30px;">评论总数:(<strong id="ccount">${commentCount}</strong>)</p>
        </fieldset>
        <div class="layui-tab layui-tab-card">
            <form id="articleForm" method="post">
                <input type="hidden" name="currentUrl" id="currentUrl" value="">
                <table class="layui-table">
                    <colgroup>
                        <col width="40">
                        <col width="40">
                        <col width="300">
                        <col width="200">
                        <col width="100">
                        <col width="50">
                    </colgroup>
                    <thead>
                    <tr>
                        <th style="text-align:center;">评论者</th>
                        <th style="text-align:center;"> 头像</th>
                        <th style="text-align:center;">评论内容</th>
                        <th style="text-align:center;">评论页面</th>
                        <th style="text-align:center;">日期</th>
                        <th style="text-align:center;">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${userComment}" var="comment">

                        <tr>
                            <td align="center">
                                ${comment.commentName}
                            </td>
                            <td align="center">
                                <img src="<%=request.getContextPath()%>/static/pic/comment/default.jpg" alt="" width="45" height="45"
                                     style="border-radius: 50%">
                            </td>
                            <td align="center">
                               ${comment.commentContent}
                            </td>
                            <td align="center">

                                <c:forEach items="${articles}" var="article">

                                    <c:if test="${article.id == comment.articleId}">

                                        ${article.title}

                                    </c:if>

                                </c:forEach>

                            </td>

                            <td>
                                <fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                            <td align="center">
                                <button class="layui-btn" type="button" data-index="${comment.id}" id="reply"
                                        data-type="editor">回复</button>
                                <button type="button" class="layui-btn layui-btn-danger layui-btn-mini" id="del"
                                        data-type="remove" data-index="${comment.id}">删除</button>
                            </td>
                        </tr>


                    </c:forEach>


                    </tbody>
                </table>
            </form>

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
    $("[id=del]").on("click", function () {
        var cid = $(this).attr('data-index');
        layer.confirm('确定要删除？', {
            btn: ['确认', '取消'] //按钮
        }, function () {
            $.post('<%=request.getContextPath()%>/admin/comment/delete/' + cid, {
                cid: cid
            }, function (data) {
                if (data.state == 1) {
                    layer.alert('删除成功',{icon: 1},function () {
                        location.reload();
                    });
                } else {
                    layer.alert("删除失败", {icon: 5});
                }
            }, 'json');
        });
    });

    $("[id=reply]").on("click", function () {
        var cid = $(this).attr('data-index');
        var str = "<%=request.getContextPath()%>/admin/comment/addreply/" + cid ;
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
                            layer.alert("回复成功", {icon: 1},function () {
                                location.reload();
                            });
                        } else
                            layer.msg("回复失败");
                    }
                });
                layer.close(index);
            }
        });
    });
</script>


<style id="LAY_layadmin_theme">
    .layui-side-menu,
    .layadmin-pagetabs .layui-tab-title li:after,
    .layadmin-pagetabs .layui-tab-title li.layui-this:after,
    .layui-layer-admin .layui-layer-title,
    .layadmin-side-shrink .layui-side-menu .layui-nav>.layui-nav-item>.layui-nav-child {
        background-color: #20222A !important;
    }

    .layui-nav-tree .layui-this,
    .layui-nav-tree .layui-this>a,
    .layui-nav-tree .layui-nav-child dd.layui-this,
    .layui-nav-tree .layui-nav-child dd.layui-this a {
        background-color: #009688 !important;
    }

    .layui-layout-admin .layui-logo {
        background-color: #20222A !important;
    }
</style>
</body>

</html>
