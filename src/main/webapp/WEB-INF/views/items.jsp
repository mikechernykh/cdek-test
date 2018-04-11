<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title><spring:message code="itemsPage.title"/></title>
</head>
<body>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <spring:message code="itemsPage.title"/>
            </li>
        </ol>
    </nav>
    <div>
        <ul>
            <li><a href="?locale=en">English</a></li>
            <li><a href="?locale=ru">Русский</a></li>
        </ul>
    </div>
    <a href="${pageContext.request.contextPath}/items/create" class="btn btn-primary mb-3">
        <spring:message code="itemsPage.btnAdd"/>
    </a>
    <form action="${pageContext.request.contextPath}/items/search">
        <div class="input-group">
            <div class="input-group-prepend">
                <label for="searchName" class="input-group-text">
                    <spring:message code="searchPage.label"/>
                </label>
            </div>
            <input class="form-control" type="text" id="searchName" name="searchName">
            <div class="input-group-append">
                <button class="btn btn-outline-success"><spring:message code="searchPage.btnSearch"/></button>
            </div>
        </div>
    </form>
    <h3 class="h3"><spring:message code="itemsPage.title"/></h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col"><spring:message code="itemsPage.tabCol.id"/></th>
            <th scope="col"><spring:message code="itemsPage.tabCol.name"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${pages.content}">
            <tr>
                <td><a href="/items/${item.id}">${item.id}</a></td>
                <td>${item.name}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${pages.totalPages gt 1}">
        <nav>
            <ul class="pagination">
                <c:forEach var="page" begin="0" step="1" end="${pages.totalPages - 1}">
                    <c:choose>
                        <c:when test="${pages.number eq page}">
                            <li class="page-item active">
                                <a href="?page=${page}&size=${pages.size}" class="page-link">${page + 1}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a href="?page=${page}&size=${pages.size}" class="page-link">${page + 1}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>
    </c:if>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
