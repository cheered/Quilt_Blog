<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/7
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>Admin Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/supersized.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/login.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/font-awesome/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" href="./static/layuiadmin/layui/css/layui.css" media="all"> -->

</head>
<body>
<div class="page-container">
    <h1>Login</h1>
    <form>
        <input type="text" id="userName" name="userName" class="username" placeholder="Username">
        <input type="password" id="userPass" name="userPass" class="password" placeholder="Password">
        <button type="button" id="login">Sign me in</button>
        <div class="error"><span>+</span></div>
    </form>
    <div class="connect">
        <p>Or connect with:</p>
        <p>
            <a  href="#"><i class="fa fa-github fa-3x" style=" color:#FFF;"></i></a>
        </p>
    </div>
</div>

<script src="<%=request.getContextPath()%>/static/jquery/jquery.js"></script>
<script src="<%=request.getContextPath()%>/static/js/supersized.3.2.7.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/supersized-init.js"></script>
<script src="<%=request.getContextPath()%>/static/js/scripts.js"></script>
<script src="<%=request.getContextPath()%>/static/js/md5.js"></script>
<!-- 弹窗 -->
<script src="<%=request.getContextPath()%>/static/layuiadmin/layui/layui.all.js" charset="utf-8"></script>
<!-- 背景渐变 修改js -->
<!-- /static/js/supersized-init.js -->
</body>

<script>
    // 异步提交表单
    $(document).ready(
        $("#login").on("click", function() {
            // 检查用户名密码是否为空 密码MD5加密

            if($("#userName").val() == "" || $('#userPass').val() == "") {
                layer.msg('用户名或密码为空');
            }

            var fd = new FormData();
            fd.append("username", $("#userName").val());
            fd.append("password", md5($('#userPass').val()));
            // alert(fd.get("password"))
            $.ajax({
                type: 'post',
                data:
                    {
                        username: $("#userName").val(),
                        password: md5($('#userPass').val())
                    },
                url: '<%=request.getContextPath()%>/login/check',
                cache: false,
                dataType: 'text',
                success: function (data) {
                    var data1 = $.parseJSON(data);
                    if(data1.state == 0){
                        layer.msg("登陆失败");
                    }else {
                        // layer.msg("成功！");
                        location.href = "<%=request.getContextPath()%>/admin/index"
                    }
                }
            });
        })
    );
</script>
</html>

