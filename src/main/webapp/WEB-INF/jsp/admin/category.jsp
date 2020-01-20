<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/8
  Time: 17:02
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
    <!-- <link id="layuicss-layer" rel="stylesheet" -->
    <!-- href="http://www.sincenovember.top/static/layuiadmin/layui/css/modules/layer/default/layer.css?v=3.1.1"
    media="all"> -->
</head>

<body layadmin-themealias="default">
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>文章目录</legend>
        </fieldset>
        <div class="layui-form">
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">
                        <h3><strong>添加分类</strong></h3>
                    </div>
                    <hr class="layui-bg-black">
                    <div class="layui-card-body layui-text">
                        <div class="layui-form-item">
                            名称 <span style="color: #FF5722; ">*</span>
                            <div class="layui-input-block">
                                <input type="text" id="categoryName" placeholder="请输入分类名称" autocomplete="off"
                                       class="layui-input" required="">
                            </div>
                            <br>
                            父节点 <span style="color: #FF5722; ">*</span>
                            <div class="layui-input-block">

                                <select name="type" id="categoryPid">
                                    <option value="0">无父结点</option>

                                    <C:forEach items="${categoryParentList}" var="categoryParent" >

                                        <option value="${categoryParent.id}">${categoryParent.categoryName}</option>

                                    </C:forEach>

                                </select>
                                <div class="layui-unselect layui-form-select">
                                    <div class="layui-select-title"><input type="text" placeholder="请选择"
                                                                           value="无父结点" readonly="" class="layui-input layui-unselect"><i
                                            class="layui-edge"></i></div>
                                    <dl class="layui-anim layui-anim-upbit">
                                        <dd lay-value="0" class="layui-this">无父结点</dd>

                                        <C:forEach items="${categoryParentList}" var="categoryParent" >

                                            <dd lay-value="${categoryParent.id}" class="">${categoryParent.categoryName}</dd>

                                        </C:forEach>


                                    </dl>
                                </div>

                            </div>
                            <br>

                            <br>
                            <div class="layui-input-block">
                                分类描述
                                <input type="text" id="categoryDescription" placeholder="请输入分类描述" autocomplete="off"
                                       class="layui-input">
                            </div>
                            <br>
                            <div class="layui-input-block">
                                <button class="layui-btn" data-type="insert" type="submit">添加</button>
                            </div>
                        </div>
                        <blockquote class="layui-elem-quote layui-quote-nm">
                            温馨提示：
                            <ul>
                                <li>1.分类名勿重复</li>
                                <li>2.父节点默认自己为根节点</li>
                                <li>3.排序默认为最低排序</li>
                            </ul>
                        </blockquote>
                    </div>
                </div>
            </div>
        </div>


        <div class="layui-col-md8">
            <table class="layui-table">
                <colgroup>
                    <col width="200">
                    <col width="250">
                    <col width="50">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>分类名称</th>
                    <th>描述</th>
                    <th>文章数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <C:forEach items="${categoryParentList}" var="categoryParent">
                    <tr>
                        <td>
                            ${categoryParent.categoryName}
                        </td>
                        <td>
                            ${categoryParent.categoryDescription}
                        </td>

                        <td align="center">
                            <span class="layui-badge layui-bg-cyan">
                                <C:forEach items="${categoryIdAndArticleCount}" var="articleCount">
                                    <C:if test="${articleCount.key == categoryParent.id}">
                                        ${articleCount.value}
                                    </C:if>
                                </C:forEach>
                            </span>
                        </td>
                        <td align="center">
                            <button class="layui-btn" data-index="${categoryParent.id}" data-type="editor">编辑</button>
                            <button class="layui-btn layui-btn-danger layui-btn-mini" data-index="${categoryParent.id}"
                                    data-type="remove">删除</button>
                        </td>
                    </tr>

                    <C:forEach items="${categoryChildList}" var="categoryChild">

                        <C:if test="${categoryChild.categoryPid == categoryParent.id}">
                            <tr>
                                <td>
                                    -----------${categoryChild.categoryName}-------------
                                </td>
                                <td>
                                    ${categoryChild.categoryDescription}
                                </td>

                                <td align="center">
                                    <span class="layui-badge layui-bg-blue">
                                        <C:forEach items="${categoryIdAndArticleCount}" var="articleCount">
                                            <C:if test="${articleCount.key == categoryChild.id}">
                                                ${articleCount.value}
                                            </C:if>
                                        </C:forEach>
                                    </span>
                                </td>
                                <td align="center">
                                    <button class="layui-btn" data-index="${categoryChild.id}" data-type="editor">编辑</button>
                                    <button class="layui-btn layui-btn-danger layui-btn-mini" data-index="${categoryChild.id}"
                                            data-type="remove">删除</button>
                                </td>
                            </tr>
                        </C:if>
                    </C:forEach>

                </C:forEach>
                </tbody>
            </table>
            <blockquote class="layui-elem-quote layui-quote-nm">
                温馨提示：
                <ul>
                    <li>分类最多只有两级，一级分类pid=0，二级分类pid=其父节点id</li>
                    <li>如果该分类包含文章，将不可删除</li>
                </ul>
            </blockquote>
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
    var active = {
        editor: function () {
            var str = "<%=request.getContextPath()%>/admin/article/category/edit_category?id=" + $(this).attr('data-index');
            var id = $(this).attr('data-index');
            var c = $(this).parent().parent();
            layer.open({
                type: 2,
                title: '修改分类',
                content: str,
                maxmin: true,
                async: false,
                area: ['480px', '350px'],
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    var category = window["layui-layer-iframe" + index].callbackdata();
                    console.log(category);
                    $.ajax({
                        type: 'post',
                        url: '<%=request.getContextPath()%>/admin/article/category/mod/' + id,
                        data: category,
                        cache: false,
                        dataType: "json",
                        success: function (data) {
                            if (data.state == 1) {
                                layer.alert("修改成功！", { icon: 1 }, function () {
                                    window.location.reload();
                                });

                            } else
                                layer.alert("修改失败！", {icon: 5});
                        }
                    });
                    layer.close(index);
                }
            });
        },
        insert: function () {
            var categoryName = $("#categoryName").val();

            if (categoryName) {
                $.ajax({
                    url: '<%=request.getContextPath()%>/admin/article/category/add',
                    data: {
                        categoryName: $('#categoryName').val(),
                        categoryPid: $('#categoryPid').val(),
                        categoryDescription: $('#categoryDescription').val()
                    },
                    cache: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        if (data.state == 1) {
                            layer.alert("添加成功！", { icon: 1 }, function () {
                                window.location.reload();
                            });

                        } else
                            layer.alert("添加失败！", {icon: 5});

                    }
                });
            } else {
                layer.alert("分类名不能为空", {
                    icon: 5
                });
            }
        },
        remove: function () {
            var id = $(this).attr('data-index');
            var c = $(this).parent().parent();
            layer.confirm('确定要删除？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('<%=request.getContextPath()%>/admin/article/category/delete/' + id, {

                }, function (data) {
                    if (data.state == 1) {
                        layer.alert("删除成功！", { icon: 1 }, function () {
                            window.location.reload();
                        });

                    } else
                        layer.alert("删除失败！", {icon: 5});
                }, 'json');
            }, function () {});
        }
    }
    $(document).on('click', '.layui-btn', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
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

