<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/8
  Time: 17:18
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/editor/css/editormd.css" />
</head>

<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>个人资料</legend>
        </fieldset>
        <div class="layui-col-sm12">
            <div class="layui-card">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-sm9" style="margin-left:2.3rem">
                        <div class="layui-card-body layui-text">
                            <div class="layui-form-item">
                                <form class="layui-form" id="myForm" method="POST" enctype="multipart/form-data">
                                    <div class="layui-col-md9">
                                        <input type="hidden" name="userId" value="1">
                                        <div class="layui-form-item">
                                            <div style="position:relative;left:70px">
                                                <img class="layui-upload-img" src="<%=request.getContextPath()%>${user.headPic}"
                                                     id="prevView" width="100" height="100">
                                                <input type="file" name="headPic" class="input-avatar"
                                                       onchange="prev(this)" />
                                                &nbsp; &nbsp;
                                                <div class="layui-btn" onchange="prev(this)">上传头像</div>
                                            </div>
                                            <p id="demoText"></p>
                                        </div>

                                        <div class="layui-input-block">
                                            个人姓名
                                            <input type="text" name="userNickname" value="${user.userNickname}"
                                                   placeholder="请输入个人名称" autocomplete="off" class="layui-input">
                                        </div>
                                        <br>

                                        <div class="layui-input-block">
                                            个人签名
                                            <input type="text" name="userSignature"
                                                   value="${user.userSignature}"
                                                   placeholder="请输入个人签名 " autocomplete="off" class="layui-input">
                                        </div>
                                        <br>
                                        <div class="layui-input-block">
                                            个人邮箱
                                            <input type="text" name="userEmail" value="${user.userEmail}"
                                                   placeholder="请输入个人邮箱" autocomplete="off" class="layui-input">
                                        </div>

                                        <br>
                                        个人简介
                                        <div class="editormd" id="test-editormd">
                                                <textarea class="editormd-markdown-textarea" name="markdownContent"
                                                          id="category_content">${user.markdownContent}</textarea>
                                            <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
                                            <textarea class="editormd-html-textarea" name="htmlContent"></textarea>

                                        </div>
                                        <br>
                                        <div class="layui-input-block">
                                            个人标签
                                            <input type="text" name="userTag" value="${user.userTag}"
                                                   placeholder="多个标签按空格隔开" autocomplete="off" class="layui-input">
                                        </div>
                                        <br>
                                        <div class="layui-input-block">
                                            <button class="layui-btn" id="save" data-type="insert"
                                                    type="button">保存</button>
                                        </div>
                                        <br>
                                        <div align="center">
                                            <div>

                                                <blockquote class="layui-elem-quote layui-quote-nm">
                                                    温馨提示：<br>
                                                    1、个人简介会用于网页的关于页面展示,请仔细编写. <br>
                                                    2、个人头像显示与后台右上角以及前台展开栏点击后显示. <br>
                                                    3、个人标签请填写时请按空格分割，分割后展示于前台Link.
                                                </blockquote>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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

<script src="<%=request.getContextPath()%>/static/editor/editormd.js"></script>
<script type="text/javascript">
    $(function () {
        var testEditor = editormd("test-editormd", {
            width: "100%",
            height: 400,
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
        });
    });
</script>
<script type="text/javascript">
    function prev(event) {
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
    $("#save").on('click', function () {
        $.ajax({
            type: "POST",
            url: '<%=request.getContextPath()%>/admin/user/info/mod',
            data: new FormData($("#myForm")[0]),
            cache: false,
            async: false,
            processData: false,
            contentType: false,
            dataType: "json",
            success: function (data) {
                if (data.state == 1) {
                    layer.alert("修改成功", { icon: 1 },function (index,item) {
                        location.reload();
                    });

                } else
                    layer.alert("修改失败", {icon: 5});
            }
        });
    });
</script>
</body>

</html>

