<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/12
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin"
     style="padding: 20px 0 0 0;">
    <div class="layui-form-item">
        <label class="layui-form-label">名称 <span style="color: #FF5722; ">*</span> </label>
        <div class="layui-input-inline">
            <input type="text" id="categoryName" value="${category.categoryName}" placeholder="请输入分类名称" autocomplete="off"
                   class="layui-input" required="">
        </div>
    </div>
    <C:if test="${category.categoryPid != 0}">
        <div class="layui-form-item">
            <label class="layui-form-label">父节点<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <select name="type" id="categoryPid">

                    <option value="0">无父节点</option>

                    <C:forEach items="${categoryParentList}" var="categoryParent" >

                        <option value="${categoryParent.id}">${categoryParent.categoryName}</option>

                    </C:forEach>

                </select>
                <div class="layui-unselect layui-form-select">
                    <div class="layui-select-title"><input type="text" placeholder="请选择" value="无父节点" readonly=""
                                                           class="layui-input layui-unselect"><i class="layui-edge"></i></div>
                    <dl class="layui-anim layui-anim-upbit">
                        <dd lay-value="0" class="layui-this">无父节点</dd>

                        <C:forEach items="${categoryParentList}" var="categoryParent" >

                            <%--TODO --%>
                            <dd lay-value="${categoryParent.id}" class="">${categoryParent.categoryName}</dd>

                        </C:forEach>

                    </dl>
                </div>
            </div>
        </div>
    </C:if>

    <div class="layui-form-item">
        <label class="layui-form-label">分类描述</label>
        <div class="layui-input-inline">
            <input type="text" id="categoryDescription" value="${category.categoryDescription}" placeholder="请输入分类描述" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-hide">
        <input type="button" lay-submit="" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" value="确认">
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
    var callbackdata = function () {
        var data = {
            categoryName: $('#categoryName').val(),
            categoryPid: $('#categoryPid').val(),
            categoryDescription: $('#categoryDescription').val()
        };
        return data;
    }
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

