<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/8
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <title>一条被子</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/font-awesome/css/font-awesome.css">
</head>

<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect>
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <input type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search"
                           layadmin-event="serach" lay-action="/admin/search?q=">
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="note">
                        <i class="layui-icon layui-icon-note"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="fullscreen">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;">
                        <img src="<%=request.getContextPath()%>${user.headPic}" class="layui-nav-img">
                        <cite>${user.username}</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="<%=request.getContextPath()%>/admin/user/info">基本资料</a></dd>
                        <dd><a lay-href="<%=request.getContextPath()%>/admin/user/password">修改密码</a></dd>
                        <hr>
                        <dd><a href="<%=request.getContextPath()%>/admin/user/logout">退出</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>

            </ul>
        </div>

        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="console.jsp">
                    <span>一条被子</span>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu"
                    lay-filter="layadmin-system-side-menu">
                    <li data-name="home" class="layui-nav-item layui-nav-itemed">
                        <a lay-href="<%=request.getContextPath()%>/admin/console" lay-tips="主页" lay-direction="2">
                            <i class="layui-icon layui-icon-home"></i>
                            <cite>主页</cite>
                        </a>
                    </li>
                    <li data-name="component" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="文章" lay-direction="2">
                            <i class="layui-icon layui-icon-file-b"></i>
                            <cite>文章</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="carousel">

                                <a lay-href="<%=request.getContextPath()%>/admin/article/all">
                                    <i class="layui-icon layui-icon-list"></i>
                                    所有文章</a>
                            </dd>
                            <dd data-name="flow">

                                <a lay-href="<%=request.getContextPath()%>/admin/article/write">
                                    <i class="layui-icon layui-icon-survey"></i>
                                    写文章</a>
                            </dd>
                            <dd data-name="util">

                                <a lay-href="<%=request.getContextPath()%>/admin/article/category">
                                    <i class="layui-icon layui-icon-template-1"></i>
                                    分类目录</a>
                            </dd>
                            <dd data-name="code">
                                <a lay-href="<%=request.getContextPath()%>/admin/article/tag">
                                    <i class="layui-icon layui-icon-note"></i>
                                    标签</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="component" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="评论" lay-direction="2">
                            <i class="layui-icon layui-icon-reply-fill"></i>
                            <cite>评论</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="carousel">

                                <a lay-href="<%=request.getContextPath()%>/admin/comment/all">
                                    <i class="layui-icon layui-icon-menu-fill"></i>
                                    用户评论</a>
                            </dd>
                            <dd data-name="flow">
                                <a lay-href="<%=request.getContextPath()%>/admin/comment/reply">
                                    <i class="layui-icon layui-icon-friends"></i>
                                    我的回复</a>
                            </dd>

                        </dl>
                    </li>

                    <li data-name="user" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="用户" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>用户</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-href="<%=request.getContextPath()%>/admin/user/info">
                                    <i class="layui-icon layui-icon-form"></i>
                                    个人资料
                                </a>
                            </dd>
                            <dd>
                                <a lay-href="<%=request.getContextPath()%>/admin/user/password">
                                    <i class="layui-icon layui-icon-util"></i>
                                    修改密码</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="app" class="layui-nav-item">
                        <a lay-href="<%=request.getContextPath()%>/admin/log/index" lay-tips="应用" lay-direction="2">
                            <i class="layui-icon layui-icon-notice"></i>
                            <cite>日志</cite>
                        </a>
                    </li>
                    <li data-name="app" class="layui-nav-item">
                        <a lay-href="<%=request.getContextPath()%>/admin/visitor/index" lay-tips="应用" lay-direction="2">
                            <i class="layui-icon layui-icon-log"></i>
                            <cite>访问</cite>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;"></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                            <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                            <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="console.jsp" lay-attr="console.jsp" class="layui-this"><i
                            class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src="console.html" frameborder="0" class="layadmin-iframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>

<script src="<%=request.getContextPath()%>/static/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '<%=request.getContextPath()%>/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>
</body>

</html> 

