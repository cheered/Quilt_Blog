<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/29
  Time: 21:16
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
        <div id="archive">
            <div class="article-sort-title">

                文章 - ${articleList.size()}

            </div>

            <div class="article-sort">

                <div class="article-sort-item year">
                    <strong>2019</strong>
                </div>

                <c:forEach items="${articleList}" var="article" >

                    <div class="article-sort-item">
                        <time class="article-sort-item__time">
                            <fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd" />
                        </time>
                        <a class="article-sort-item__title" href="<%=request.getContextPath()%>/detail/${article.id}">${article.title}</a>
                    </div>

                </c:forEach>

            </div>

        </div>
    </div>
</div>

    <jsp:include page="common/foot.jsp"></jsp:include>

</body>

</html>

