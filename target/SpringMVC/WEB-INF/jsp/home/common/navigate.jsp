<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/29
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id="nav" style="background-image:url(<%=request.getContextPath()%>${backgroundImage})">
    <div id="page-header">
        <span class="pull-left"><strong></h2><a href="#">cheers の Blog</a></strong></span>
        <i class="fa fa-bars toggle-menu pull-right" aria-hidden="true"></i>
        <span class="pull-right menus">
                    <!-- 	<input type="search" class="site-page social-icon search"  placeholder="搜索"> -->
                    <a class="site-page social-icon search"><i class="fa fa-search"></i><span> 搜索</span></a>
                    <a class="site-page" href="<%=request.getContextPath()%>/"><i class="menu-item-icon fa fa-fw fa-home"></i>首页</a>
                    <a class="site-page" href="<%=request.getContextPath()%>/archives"><i class="menu-item-icon fa fa-fw fa-archive"></i>归档</a>
                    <a class="site-page" href="<%=request.getContextPath()%>/tags"><i class="menu-item-icon fa fa-fw fa-tags"></i>标签</a>
                    <a class="site-page" href="<%=request.getContextPath()%>/categories"><i class="menu-item-icon fa fa-fw fa-th"></i>分类</a>
                    <a class="site-page" href="<%=request.getContextPath()%>/about"> <i
                            class="menu-item-icon fa fa-fw fa-user fa-fw"></i>关于</a></span>
    </div>

    <div id="site-info">
        <div id="site-title">
            一枚枕头
        </div>
        <div id="site-sub-title">
            ${slogan}
        </div>
        <div id="site-social-icons">
            <a class="social-icon" href="/login"><i class="fa-github fa"></i></a>
            <a class="social-icon" href="/login"><i class="fa-weibo fa"></i></a>
            <a class="social-icon" href="/login"><i
                    class="fa-qq fa"></i></a>
            <a class="social-icon" href="/login"><i class="fa-facebook fa"></i></a>
            <a class="social-icon search"><i class="fa fa-search"></i></a>
        </div>
    </div>
</nav>
