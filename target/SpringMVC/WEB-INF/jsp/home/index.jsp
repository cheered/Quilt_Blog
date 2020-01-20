<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
  Created by IntelliJ IDEA.
  User: 阿鱼
  Date: 2019/6/29
  Time: 20:36
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

    <c:forEach items="${articleWithBLOBsDtoList}" var="articleWithBLOBsDto">

        <div class="recent-post-item article-container">
            <div class="contair-margin">
                <a class="article-title" href="<%=request.getContextPath()%>/detail/${articleWithBLOBsDto.articleWithBLOBs.id}">${articleWithBLOBsDto.articleWithBLOBs.title}</a>
                <time class="post-meta__date"><i class="fa fa-calendar" aria-hidden="true"></i>
                        <fmt:formatDate value="${articleWithBLOBsDto.articleWithBLOBs.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                </time>
                <span class="article-meta">
                    <span class="article-meta__separator">|</span>

                    <c:forEach items="${articleWithBLOBsDto.categories}" var="category" >

                        <i class="fa fa-inbox article-meta__icon" aria-hidden="true"></i><a
                        class="article-meta__categories" href="<%=request.getContextPath()%>/category/timeline/${category.id}">

                                   <strong>
                                        ${category.categoryName}
                                   </strong>
                              </a>

                    </c:forEach>

                    </span>

                    <span class="article-meta tags"><span class="article-meta__separator">|</span>

                        <c:forEach items="${articleWithBLOBsDto.tags}" var="tag">

                            <i class="fa fa-tag article-meta__icon" aria-hidden="true"></i>&nbsp;<a
                            class="article-meta__tags" href="<%=request.getContextPath()%>/tag/timeline/${tag.id}">${tag.tagName}</a>

                        </c:forEach>


                    </span>

                    <span class="article-meta tags"><span class="article-meta__separator">|</span>
                              <i class="fa fa-eye"></i>&nbsp;${articleWithBLOBsDto.articleWithBLOBs.viewCount}
                    </span>

                    <span class="article-meta tags"><span class="article-meta__separator">|</span>
                              <i class="fa fa-comment"></i>&nbsp;${articleWithBLOBsDto.articleWithBLOBs.commentCount}
                    </span>

                    <div class="content">
                        <%--${articleWithBLOBsDto.articleWithBLOBs.markdownContent}--%>
                        ${fn:substring(articleWithBLOBsDto.articleWithBLOBs.htmlContent, 0, 500)}

                    </div>

                <a class="more" href="<%=request.getContextPath()%>/detail/${articleWithBLOBsDto.articleWithBLOBs.id}">Read more</a>
                <hr/>
            </div>
        </div>

    </c:forEach>

        <nav id="pagination">
            <div class="pagination">

                <c:choose>
                    <%--当前页是第一页且只有一页--%>
                    <c:when test="${pagedResult.pageNo == 1 && pagedResult.pages == 1}">
                        <span class="page-number current">${pagedResult.pageNo}</span>
                    </c:when>
                    <c:when test="${pagedResult.pageNo == 1 && pagedResult.pages >1 }">
                        <span class="page-number current">${pagedResult.pageNo}</span>
                        <a class="page-number" href="<%=request.getContextPath()%>/${pagedResult.pageNo+1}"> >> </a>
                    </c:when>
                    <%--当前页不是第一页，且不是最后一页--%>
                    <c:when test="${pagedResult.pageNo != 1 && pagedResult.pageNo != pagedResult.pages }">
                        <a class="page-number" href="<%=request.getContextPath()%>/${pagedResult.pageNo-1}"> << </a>
                        <span class="page-number current">${pagedResult.pageNo}</span>
                        <a class="page-number" href="<%=request.getContextPath()%>/${pagedResult.pageNo+1}"> >> </a>
                    </c:when>
                    <%--当前最后一页--%>
                    <c:when test="${pagedResult.pageNo !=1 && pagedResult.pageNo == pagedResult.pages}">
                        <a class="page-number" href="<%=request.getContextPath()%>/${pagedResult.pageNo-1}"> << </a>
                        <span class="page-number current">${pagedResult.pageNo}</span>
                    </c:when>
                </c:choose>

            </div>
        </nav>


    </div>

</div>

    <jsp:include page="common/foot.jsp"></jsp:include>
</body>

</html>