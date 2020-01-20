<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/8
  Time: 16:45
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
<!--    列表 -->
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>所有文章</legend>
        </fieldset>
        <div class="layui-tab layui-tab-card">
            <form id="articleForm" method="post">
                <input type="hidden" name="currentUrl" id="currentUrl" value="">
                <table class="layui-table">
                    <colgroup>
                        <col width="300">
                        <col width="120">
                        <col width="120">
                        <col width="5">
                        <col width="5">
                        <col width="20">
                        <col width="100">
                        <col width="25">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>标题</th>
                        <th>所属分类</th>
                        <th>标签</th>
                        <th>点击量</th>
                        <th>评论数</th>
                        <th>发布类型</th>
                        <th>发布时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="articleListDto" items="${articleListDtoList}">
                        <tr>
                            <td>
                                <a href="#" target="_blank">
                                    ${articleListDto.article.title}
                                </a>
                            </td>

                            <td>
                                <c:forEach items="${articleListDto.categories}" var="category" >

                                    <a href="#" target="_blank">${category.categoryName}</a>
                                    &nbsp;

                                </c:forEach>
                            <td>

                                <c:forEach items="${articleListDto.tags}" var="tag">

                                    <a href="/tag/archives/42" target="_blank">${tag.tagName}</a>
                                    &nbsp;

                                </c:forEach>

                            </td>
                            <td align="center">
                                <span class="layui-badge layui-bg-cyan">${articleListDto.article.viewCount}</span>
                            </td>
                            <td align="center">
                                <span class="layui-badge">${articleListDto.article.commentCount}</span>
                            </td>
                            <td align="center">
                                <c:if test="${articleListDto.article.issueType == 1}">
                                    <span class="layui-badge layui-bg-green">正文</span>
                                </c:if>
                                <c:if test="${articleListDto.article.issueType == 0}">
                                    <span class="layui-badge layui-bg-cyan">草稿</span>
                                </c:if>

                            </td>
                            <td>
                                <fmt:formatDate value="${articleListDto.article.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                            <td align="center">
                                <!-- TODO 编辑文章 -->
                                <a lay-href="<%=request.getContextPath()%>/admin/article/edit/${articleListDto.article.id}"
                                   class="layui-btn layui-btn-mini">编辑</a>
                                <button type="button" class="layui-btn layui-btn-danger layui-btn-mini" id="del"
                                        data-type="remove" data-index="${articleListDto.article.id}">删除</button>
                            </td>
                        </tr>


                    </c:forEach>

                    </tbody>
                </table>
                <div class="layui-card-body" align="center">
                    <div id="test-laypage-demo1">
                        <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-2">
                            <a class="layui-laypage-prev layui-disabled">首页</a>
                            <a class="layui-laypage-prev layui-disabled">上一页</a>
                            <span class="layui-laypage-curr" style="background-color:#009688;"><em>1</em></span>
                            <a class="page-number" href="/admin/articles/2">2</a>
                            <a href="/admin/articles/2">下一页</a>
                            <a href="/admin/articles/2">尾页</a>

                        </div>
                    </div>
                </div>

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
        var aid = $(this).attr('data-index');
        var t = $(this).parent().parent();
        layer.confirm('确定要删除？', {
            btn: ['确认', '取消'] //按钮
        }, function () {
            $.post('/admin/article/delete/' + aid , {
                aid: aid
            }, function (data) {
                if (data.state == 1) {
                    layer.alert("删除成功", {icon: 1}, function () {
                        window.location.reload();
                    });

                } else {layer.msg("删除失败", {icon: 5});
                }
            }, 'json');
        });
    });
</script>
</body>

</html> 

