<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" output-encoding="UTF-8" <c:if test="${book != null}">title="${book.title}"</c:if><c:if test="${book == null}">title="Sorry"</c:if> xsd-version="1.12" xsi:nonamespaceschemalocation="http://www.netbiscuits.com/schema/netbiscuits-1.12.xsd">
    <container>
        <column>
            <c:if test="${book != null}">
                <TEXT>
                    <headline>${book.title}</headline>
                </TEXT>
                <IMAGE>
                    <img src="${book.thumbnailUrl}" alt="Cover Image"/>
                </IMAGE>
                <TEXT>
                    <richtext>[ul][li]Author: ${book.author}[/li][li]Price: ${book.price}[/li][/ul]</richtext>
                </TEXT>
            </c:if>
            <c:if test="${book == null}">
                <TEXT>
                    <headline>Sorry</headline>
                    <richtext>We don't have a book with ID: <%= request.getParameter("id") %></richtext>
                </TEXT>
            </c:if>
        </column>
    </container>
</page>