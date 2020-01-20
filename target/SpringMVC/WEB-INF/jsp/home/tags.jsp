<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/29
  Time: 21:21
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
        <div class="tag-cloud">
            <div class="tag-cloud__title">
                Tag -
                <span class="tag-cloud__amount">${tagCount}</span>
            </div>
            <div class="tag-cloud-tags">

                <c:forEach items="${tagList}" var="tag">


                    <a style="font-size:${tag.fontSize};color:${tag.fontColor}" href="<%=request.getContextPath()%>/tag/timeline/${tag.id}">${tag.tagName}</a>

                </c:forEach>

            </div>
        </div>
    </div>
</div>

    <jsp:include page="common/foot.jsp"></jsp:include>

</body>

</html>
