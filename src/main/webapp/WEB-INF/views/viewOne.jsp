<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title><spring:message code="viewOnePage.title"/></title>
</head>
<body>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/items"><spring:message code="itemsPage.title"/></a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
                <c:out value="${item.name}"/>
            </li>
        </ol>
    </nav>
    <div>
        <ul>
            <li><a href="?locale=en">English</a></li>
            <li><a href="?locale=ru">Русский</a></li>
        </ul>
    </div>
    <h3 class="h3"><spring:message code="viewOnePage.title"/></h3>
    <table class="table table-striped">
        <tbody>
        <tr>
            <th scope="col"><spring:message code="itemsPage.tabCol.id"/></th>
            <td>${item.id}</td>
        </tr>
        <tr>
            <th scope="col"><spring:message code="itemsPage.tabCol.name"/></th>
            <td>${item.name}</td>
        </tr>
        </tbody>
    </table>
    <div>
        <a href="/items/${item.id}/edit" class="btn btn-secondary">
            <spring:message code="viewOnePage.btnEdit"/>
        </a>
        <a href="/items/${item.id}/delete" class="btn btn-danger">
            <spring:message code="viewOnePage.btnDelete"/>
        </a>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
