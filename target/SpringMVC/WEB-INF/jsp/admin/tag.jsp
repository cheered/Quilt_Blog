<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/8
  Time: 17:06
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
    <!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/my.css" media="all"> -->

</head>

<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>标签目录</legend>
        </fieldset>

        <div class="layui-form">
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">
                        <h3><strong>添加标签</strong></h3>
                    </div>
                    <hr class="layui-bg-black">
                    <div class="layui-card-body layui-text">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                名称 <span style="color: #FF5722; ">*</span>
                                <input type="text" name="tagName" id="tagName" placeholder="请输入标签名称"
                                       autocomplete="off" class="layui-input" required>
                            </div>
                            <br>
                            <div class="layui-input-block">
                                字体大小
                                <input type="text" name="fontSize" id="fontSize" placeholder="字体大小，例如15px"
                                       value="20px" autocomplete="off" class="layui-input">
                            </div>
                            <br>
                            <div class="layui-input-block">
                                字体颜色
                                <input type="color" id="fontColor" value="#26211e" class="layui-input" />
                            </div>
                            <br>
                            <div class="layui-input-block">
                                <button class="layui-btn" id="confirm" lay-filter="formDemo" data-type="insert"
                                        type="submit">添加</button>
                            </div>
                        </div>
                        <blockquote class="layui-elem-quote layui-quote-nm">
                            温馨提示：
                            <ul>
                                <li>1、标签名必选，建议不要太长</li>
                                <li>2、标签名勿重复</li>
                                <li>3、字体大小跟颜色需按要求填写</li>
                            </ul>
                        </blockquote>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-col-md8">
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="50">
                    <col width="50">
                    <col width="150">
                    <col width="50">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>名称</th>
                    <th>大小</th>
                    <th>颜色</th>
                    <th>样式</th>
                    <th>文章数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${tagList}" var="tag">
                    <tr>
                        <td>
                            <a href="/tag/2" target="_blank">${tag.tagName}</a>
                        </td>
                        <td>
                           ${tag.fontSize}
                        </td>
                        <td>
                           ${tag.fontColor}
                        </td>
                        <td>
                            <span style="font-size:${tag.fontSize};color:${tag.fontColor}">${tag.tagName}</span>
                        </td>
                        <td align="center">
                            <span class="layui-badge layui-bg-orange" id="articleCount" value="1">
                                <c:forEach items="${tagIdAndArticleCount}" var="articleCount">
                                    <c:if test="${tag.id == articleCount.key}">
                                        ${articleCount.value}
                                    </c:if>
                                </c:forEach>
                            </span>
                        </td>
                        <td align="center">
                            <button class="layui-btn" data-index="${tag.id}" data-type="editor">编辑</button>
                            <button class="layui-btn layui-btn-danger layui-btn-mini" data-index="${tag.id}"
                                    data-type="remove">删除</button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <blockquote class="layui-elem-quote layui-quote-nm">
                温馨提示：
                <ul>
                    <li>如果该标签包含文章，将不可删除</li>
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
    //事件
    var active = {
        editor: function () {
            var str = "<%=request.getContextPath()%>/admin/article/tag/edit_tag?id="+ $(this).attr('data-index');
            var tid = $(this).attr('data-index');
            var t = $(this).parent().parent();
            layer.open({
                type: 2,
                title: '修改标签',
                content: str,
                maxmin: true,
                async: false,
                area: ['480px', '350px'],
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    var tag = window["layui-layer-iframe" + index].callbackdata();
                    $.ajax({
                        url: '/admin/article/tag/mod/' + tid,
                        data: tag,
                        cache: false,
                        dataType: "json",
                        success: function (data) {
                            if (data.state == 1) {
                                layer.alert("修改成功", {icon: 1} , function () {
                                    location.reload();
                                });

                            } else
                                layer.msg("修改失败");
                        }
                    });
                    layer.close(index);
                }
            });
        },
        insert: function () {
            var tagName = $('#tagName').val();
            var fontSize = $('#fontSize').val();
            var fontColor = $('#fontColor').val();
            if (tagName) {
                $.ajax({
                    url: '/admin/article/tag/add',
                    data: {
                        'tagName': tagName,
                        'fontSize': fontSize,
                        'fontColor': fontColor
                    },
                    cache: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        if(data.state == 1){
                        layer.alert("添加成功", {icon: 1} , function () {
                             location.reload();
                        });
                     }else {
                            layer.alert("添加失败", {icon: 5 });
                        }
                    }
                })
            } else {
                layer.alert("标签名不能为空", {
                    icon: 5
                });
            }
        },

        remove: function () {
            var tid = $(this).attr('data-index');
            var t = $(this).parent().parent();
            layer.confirm('确定要删除？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('<%=request.getContextPath()%>/admin/article/tag/delete/'+ tid, {
                }, function (d) {
                    if (d.state == 1) {
                        layer.msg("删除成功",{ time : 1000 } ,function () {
                            location.reload();
                        });
                    }
                    layer.msg("删除失败");
                }, 'json');
            }, function () {});
        }
    }
    $(document).on('click', '.layui-btn', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
</script>

</body>

</html>

