<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/8
  Time: 17:22
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
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">修改密码</div>
                <div class="layui-card-body" pad15="">

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userName" id="userName" value="admin"
                                       lay-verify="required" lay-vertype="tips" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">当前密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="userPass" id="userPass" lay-verify="required"
                                       lay-vertype="tips" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="newPass" lay-verify="required" lay-vertype="tips"
                                       autocomplete="off" id="newPass" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确认新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="rePass" id="rePass" lay-verify="required"
                                       lay-vertype="tips" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="setmypass">确认修改</button>
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
<script src="<%=request.getContextPath()%>/static/js/md5.js"></script>
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

<script type="text/javascript">
    $(".layui-btn").on('click', function () {
        var newName = $("#userName").val();
        var nowPass = md5($("#userPass").val());
        var newPass = md5($("#newPass").val());
        var rePass = md5($("#rePass").val());
        console.log(userPass);

        if (newPass == rePass) {

            $.ajax({
                type:'post',
                url : '<%=request.getContextPath()%>/admin/user/password/mod',
                data : {
                    newName : newName,
                    nowPass : nowPass,
                    newPass : newPass
                },
                dataType : 'text',
                success : function (result) {
                    var data = $.parseJSON(result);
                    if(data.state == 0){
                        layer.alert("修改失败",{icon:5});
                    }else{
                        if (data.state == 300){
                            layer.alert(data.stateInfo,{icon:5});
                        }
                        else {
                            if (data.state == 1){
                                layer.alert("修改成功",{icon:1},function (index,item) {
                                    location.reload();
                                })
                            } else {
                                layer.alert("修改失败",{icon:5});
                            }
                        }
                    }
                }
            })
        } else {
            layer.tips('两次密码不一致', '#rePass');
        }
    });
</script>
</body>

</html>


