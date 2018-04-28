<%-- 
    Document   : success
    Created on : 13 Mar, 2018, 4:13:52 PM
    Author     : Lenovo
--%>

<%@page import="com.sun.rowset.JdbcRowSetImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="connectionproperties.ConnectionBean"%>
<%@page import="org.apache.mahout.cf.taste.impl.common.FastIDSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.shelf.session.UserBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.mahout.cf.taste.recommender.RecommendedItem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${sessionScope.user.firstName}-Dashboard</title>

    </head>
    <body>
        <%@include file="cachecontroller.jsp" %>
        <header><%@include file="basetemplate.jsp" %></header>
        <br>
        <br>
        <main>

            <c:choose>
                <c:when test="${sessionScope.user ne null}">
                    <script>
                        var toastHTML = '<span>You have one book return due</span><button class="btn-flat toast-action">Dismiss</button>';
                    </script>
                    <div id="test-swipe-2">
                        <%--<%@include file="arrivals.jsp" %>--%>
                    </div>

                    <div id="test-swipe-1">
                        <%--<%@include file="recommendations.jsp" %>--%>
                    </div>
                    <div id="test-swipe-3">
                        My Books
                    </div>
                    <div id="test-swipe-4">
                        <%--<%@include file="results.jsp" %>--%>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:redirect url="index.jsp"/>
                </c:otherwise>
            </c:choose>
        </main>
        <script src="materialize/js/searchenable.js"></script>
        <!--<script src="js/zxcvbn.js"></script>-->
    </body>
</html>
