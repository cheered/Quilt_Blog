<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/8
  Time: 16:57
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
    <!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/static/editor/css/style.css" /> -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/editor/css/editormd.css" />

    <style>
        input[type="file"] {
            position: absolute;
            left: 0;
            top: 0;
            height: 200px;
            opacity: 0;
            cursor: pointer;
        }
    </style>
    <!--        预览图片 -->
    <script type="text/javascript">
        function prev(event) {
            //获取展示图片的区域
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
</head>

<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>编辑文章</legend>
        </fieldset>
        <form class="layui-form" id="myForm" method="POST" enctype="multipart/form-data">
            <div class="layui-col-md8">
                <div align="center">
                    <div class="layui-form-item" style="width: 90%;">
                        <input type="text" name="articleTitle" id="articleTitle" lay-verify="title"
                               autocomplete="off" placeholder="请输入标题" class="layui-input"
                               value="${articleWithBLOBs.title}">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div id="layout" style="width:100%;background: #f6f6f6;">
                        <div class="editormd" id="test-editormd">
                                <textarea class="editormd-markdown-textarea" name="markdownContent"
                                          id="category_content">${articleWithBLOBs.markdownContent}</textarea>
                            <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
                            <textarea class="editormd-html-textarea" name="htmlContent"></textarea>

                        </div>

                        <div align="center">
                            <div>

                                <blockquote class="layui-elem-quote layui-quote-nm">
                                    温馨提示：<br>
                                    1、文章内容的数据表字段类型为MEDIUMTEXT,每篇文章内容请不要超过500万字 <br>
                                    2、写文章之前，请确保标签和分类存在，否则可以先新建；请勿刷新页面，博客不会自动保存 <br>
                                    3. 写的文章前俩个空格段将做为文章summary,大标题前会自动有空格段
                                </blockquote>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="layui-col-md4">
                <div style="width:350px">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <h2>发布</h2>
                        </div>
                        <hr class="layui-bg-black">
                        <div class="layui-card-body layui-text">
                            <img src="<%=request.getContextPath()%>${articleWithBLOBs.articlePic}" alt="" width="300" height="200" id="prevView">
                            <input type="file" name="articleImage" id="" value=""
                                   onchange="prev(this)" />
                            <table class="layui-table">
                                <colgroup>
                                    <col width="100">
                                    <col>
                                </colgroup>
                                <label class="layui-form-label">文章类型：</label>

                                <div class="layui-input-block">
                                    <select name="articleType" lay-verify="required" lay-filter="aihao">
                                        <option value="0" <C:if test="${articleWithBLOBs.articleType == 0}"> selected="selected"</C:if>>原创</option>
                                        <option value="1" <C:if test="${articleWithBLOBs.articleType == 1}"> selected="selected"</C:if>>转载</option>
                                    </select>
                                </div>
                                <label class="layui-form-label">发布类型：</label>
                                <div class="layui-input-block">
                                    <select name="issueType" lay-verify="required" lay-filter="aihao">
                                        <option value="1" <C:if test="${articleWithBLOBs.issueType == 1}"> selected="selected"</C:if>>正文</option>
                                        <option value="0" <C:if test="${articleWithBLOBs.issueType == 0}"> selected="selected"</C:if>>草稿</option>
                                    </select>
                                    <br>
                                    <button class="layui-btn" type="button" id="issue">提交修改</button>
                                    <button type="reset" class="layui-btn layui-btn-primary"
                                            onclick="getCateIds()">重置</button>
                                </div>
                        </div>
                        </table>
                    </div>
                </div>

                <div class="layui-card">
                    <div class="layui-card-header">
                        <h2>文章分类</h2>
                    </div>
                    <hr class="layui-bg-black">
                    <div class="layui-card-body layui-text">
                        <table class="layui-table">
                            <colgroup>
                                <col width="100">
                                <col>
                            </colgroup>

                            <C:forEach items="${parentCategoryList}" var="parentCategory" >

                                <input type="checkbox" name="articleCategoryId" lay-skin="primary" title="${parentCategory.categoryName}"
                                       value="${parentCategory.id}"><br>

                                <C:forEach items="${childCategoryList}" var="childCategory">

                                    <C:if test="${childCategory.categoryPid == parentCategory.id}" >

                                        &nbsp; &nbsp; &nbsp; <input type="checkbox" name="articleCategoryId" lay-skin="primary"
                                                                    title="${childCategory.categoryName}" value="${childCategory.id}"><br>

                                    </C:if>

                                </C:forEach>

                            </C:forEach>

                        </table>
                    </div>
                </div>
                <div class="layui-card">
                    <div class="layui-card-header">
                        <h2>标签</h2>
                    </div>
                    <hr class="layui-bg-black">
                    <div class="layui-card-body layui-text">
                        <table class="layui-table">
                            <colgroup>
                                <col width="100">
                                <col>
                            </colgroup>

                            <C:forEach var="tag" items="${tagList}">

                                <input type="checkbox" name="articleTagId" lay-skin="primary" title="${tag.tagName}" value="${tag.id}">

                            </C:forEach>

                        </table>
                    </div>
                </div>

            </div>
    </div>
    </form>
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

<script src="<%=request.getContextPath()%>/static/editor/editormd.js"></script>
<script type="text/javascript">
    $(function () {
        var testEditor = editormd("test-editormd", {
            width: "90%",
            height: 1300,
            markdown: "",
            path: '<%=request.getContextPath()%>/static/editor/lib/',
            syncScrolling: "single",
            emoji: true,
            saveHTMLToTextarea: true,
            tocm: true, // Using [TOCM]
            tex: true, // 开启科学公式TeX语言支持，默认关闭
            flowChart: true, // 开启流程图支持，默认关闭
            /* 上传图片配置 */
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "<%=request.getContextPath()%>/admin/file/upload", //注意你后端的上传图片服务地址
            /**
             @RequestParam(value = "editormd-image-file", required = true注解）
             后端接收,参数名不能修改
             {
             success : 0 | 1, //0表示上传失败;1表示上传成功
             message : "提示的信息",
             url : "图片地址" //上传成功时才返回
             }
             */
        });
    });
</script>
<script>
    $("#issue").on("click", function () {
        var title = $("#articleTitle").val();
        var content = $("#category_content").val();
        console.log(title);
        console.log(content);
        if (title && content) {

            $.ajax({
                type: "POST",
                url: '<%=request.getContextPath()%>/admin/article/mod/' + ${articleWithBLOBs.id},
                data: new FormData($("#myForm")[0]),
                cache: false,
                async: false,
                processData: false,
                contentType: false,
                dataType: "json",
                success: function (data) {
                    if (data.state==1) {
                        layer.alert("修改成功", {icon: 1},function(){
                            location.reload();
                        });
                    } else
                        layer.alert("修改失败", {icon: 5});

                }
            });
        } else {
            layer.alert("标题和正文不能为空");
        }
    });
</script>

<script type="text/javascript">

    var tagList = new Array();
    var categoryList = new Array();

    <c:forEach items="${tags}" var="tag">
         tagList.push(${tag.id});
    </c:forEach>

    <C:forEach items="${categories}" var="category">
         categoryList.push(${category.id});
    </C:forEach>

    for (var i = 0; i < tagList.length ; i++) {

        $('input[value=' + tagList[i] + '][name="articleTagId"]').attr("checked","checked");
    }

    for (var i = 0; i < categoryList.length ; i++) {

        $('input[value=' + categoryList[i] + '][name="articleCategoryId"]').attr("checked","checked");
    }

</script>
</body>

</html> 

