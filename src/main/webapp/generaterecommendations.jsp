<%-- 
    Document   : generaterecommendations
    Created on : 23 Mar, 2018, 1:00:41 PM
    Author     : Lenovo
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.mahout.cf.taste.recommender.RecommendedItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${sessionScope.user.firstName}-Recommendations</title>
    </head>
    <body>
        <%@include file="cachecontroller.jsp" %>
        <c:choose>
            <c:when test="${sessionScope.user ne null}">
                <h1> Hello Recommendations are being generated</h1>
                
            </c:when>
        </c:choose>
    </body>
</html>


