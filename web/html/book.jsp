<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:if test="${book != null}">
            <title>${book.title}</title>
        </c:if>
        <c:if test="${book == null}">
            <title>Sorry!</title>
        </c:if>
    </head>
    <body>
        <c:if test="${book != null}">
            <h1>${book.title}</h1>
            <img src="${book.thumbnailUrl}" alt="Cover Image"/>
            <ul>
                <li>Author: ${book.author}</li>
                <li>Price: ${book.price}</li>
            </ul>
        </c:if>
        <c:if test="${book == null}">
            <h1>Sorry</h1>
            <p>We don't have a book with ID: <%= request.getParameter("id") %></p>
        </c:if>
    </body>
</html>
