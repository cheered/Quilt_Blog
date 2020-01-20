<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/29
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <jsp:include page="common/head.jsp"></jsp:include>

</head>

<body>

<canvas class="fireworks"></canvas>
<i class="fa fa-arrow-right" id="toggle-sidebar" aria-hidden="true"></i>

    <jsp:include page="common/navigate.jsp"></jsp:include>

<div id="content-outer">
    <div class="layout" id="content-inner">
        <article id="page" style="margin-left:0.5rem;margin-right:0.5rem">
            ${htmlContent}
        </article>
    </div>

</div>

    <jsp:include page="common/foot.jsp"></jsp:include>

</body>

</html>
