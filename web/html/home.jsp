<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MVC Demo</title>
    </head>
    <body>
        <h1>MVC Demo</h1>
        <h2>Books In Stock:</h2>
        <c:forEach var="book" items="${books}">
            <c:if test="${book.inStock}">
                <h3>${book.title} (<a href="details.do?id=${book.id}">details</a>)</h3>
                <hr/>
            </c:if>
        </c:forEach>
    </body>
</html>
