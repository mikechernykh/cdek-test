<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title><spring:message code="editPage.title"/></title>
</head>
<body>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/items"><spring:message code="itemsPage.title"/></a>
            </li>
            <li class="breadcrumb-item">
                <a href="/items/${itemForm.id}"><c:out value="${itemForm.name}"/></a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
                <spring:message code="editPage.title"/>
            </li>
        </ol>
    </nav>
    <div>
        <ul>
            <li><a href="?locale=en">English</a></li>
            <li><a href="?locale=ru">Русский</a></li>
        </ul>
    </div>
    <h3 class="h3 mb-3"><spring:message code="editPage.title"/></h3>
    <form:form modelAttribute="itemForm" method="post">
        <div class="form-group">
            <form:label path="name">
                <spring:message code="editPage.label"/>
            </form:label>
            <form:input path="name" class="form-control"/>
        </div>
        <button class="btn btn-primary"><spring:message code="editPage.button"/></button>
    </form:form>
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
