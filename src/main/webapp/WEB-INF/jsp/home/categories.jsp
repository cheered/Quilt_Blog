<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/29
  Time: 21:24
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
        <div id="post-content">
            <div class="category-lists">
                <div class="category__title">
                    Category -
                    <span class="category__amount">${categoryCount}</span>
                </div>
                <div>
                    <ul class="category-list">

                        <c:forEach items="${categoryParentList}" var="categoryParent">
                            <li class="category-list-item">
                                <a class="category-list-link" href="<%=request.getContextPath()%>/category/timeline/${categoryParent.id}"><strong>
                                    ${categoryParent.categoryName}
                                </strong></a>
                                <span class="category-list-count">
                                    <c:forEach items="${categoryIdAndArticleCount}" var="articleCount">
                                        <c:if test="${categoryParent.id == articleCount.key}">
                                            ${articleCount.value}
                                        </c:if>
                                    </c:forEach>
                                </span>

                                <c:forEach items="${categoryChildList}" var="categoryChild">
                                    <c:if test="${categoryChild.categoryPid == categoryParent.id}">

                                    <ul class="category-list-child">
                                        <li class="category-list-item">
                                            <a class="category-list-link" href="<%=request.getContextPath()%>/category/timeline/${categoryChild.id}">${categoryChild.categoryName}</a>
                                            <span class="category-list-count">
                                            <c:forEach items="${categoryIdAndArticleCount}" var="articleCount">
                                                <c:if test="${categoryChild.id == articleCount.key}">
                                                    ${articleCount.value}
                                                </c:if>
                                            </c:forEach>
                                        </span>
                                        </li>
                                    </ul>
                                    </c:if>
                                </c:forEach>
                                </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>


    <jsp:include page="common/foot.jsp"></jsp:include>

</body>

</html>