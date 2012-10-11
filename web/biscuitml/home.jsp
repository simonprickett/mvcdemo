<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" output-encoding="UTF-8" title="MVC Demo" xsd-version="1.12" xsi:nonamespaceschemalocation="http://www.netbiscuits.com/schema/netbiscuits-1.12.xsd">
    <container>
        <column>
            <TEXT>
                <headline>MVC Demo</headline>
                <richtext>Books In Stock:</richtext>
            </TEXT>
            <c:forEach var="book" items="${books}">
                <c:if test="${book.inStock}">
                    <TEASER href="details.do?id=${book.id}">
                        <styles>
                            <style name="borders" value="bottom"/>
                            <style name="border-width" value="1px"/>
                            <style name="border-color" value="#000000"/>
                        </styles>
                        <img src="${book.thumbnailUrl}"/>
                        <richtext>${book.title}</richtext>
                    </TEASER>
                </c:if>
            </c:forEach>
        </column>
    </container>
</page>
