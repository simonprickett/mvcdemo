<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" output-encoding="UTF-8" title="MVC Demo" xsi:noNamespaceSchemaLocation="http://www.netbiscuits.com/schema/netbiscuits-tactile.xsd">
    <external type="css" file="tactile/demo.css"/>
    <external type="script" file="tactile/demo.js"/>
    <layout id="root" width="100%" height="100%" top="0" left="0" opacity="100" zindex="1">
        <gridview id="gridview" gridflow="horizontal" width="100%" height="100%" top="0" left="0" opacity="100" zindex="1" items-height="(parent.width * .2) - 30" items-width="(parent.width * .2) - 30" items-hgap="5" items-vgap="5">
            <c:forEach var="book" items="${books}">
                <c:if test="${book.inStock}">
                    <item id="${book.id}" ontap="#demo.toggleLightBox('${book.id}')">
                        <TEASER>
                            <styles>
                                <style name="borders" value="all"/>
                                <style name="border-width" value="1px"/>
                                <style name="border-color" value="#000000"/>
                            </styles>
                            <headline>${book.title}</headline>
                            <richtext>By ${book.author} (${book.price})</richtext>
                        </TEASER>
                    </item>
                </c:if>
            </c:forEach>
        </gridview>
        <layout id="lightbox" class="lightbox" width="70%" height="70%" top="parent.height*.15" left="parent.width*.15" zindex="200" display="none" ontap="#demo.toggleLightBox('-1')">        
        </layout>
        <layout id="maskinglayer" class="lightboxmask" width="100%" height="100%" top="0" left="0" opacity="50" zindex="100" display="none">
        </layout>
    </layout>
</page>

