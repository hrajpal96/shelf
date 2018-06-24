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
        <jsp:include page="cachecontroller.jsp" ></jsp:include>
            <header>
            <jsp:include page="basetemplate.jsp" ></jsp:include>
            </header>
            <br>
            <br>
            <main>

            <c:choose>
                <c:when test="${sessionScope.user ne null}">
                    <style>
                        #toast-container {
                            top: auto !important;
                            right: auto !important;
                            bottom: 10%;
                            left:7%;  
                        }
                    </style>
                    <% if (session.getAttribute("validated") != null) {
                            if (!(Boolean) session.getAttribute("validated")) {
                    %>
                    <script>Materialize.toast('Please verify your Email-Id to access important features.', 2000, 'bottom');</script>
                    <%
                            }
                        }
                    %>
                    <div id="test-swipe-2">
                        <%@include file="arrivals.jsp" %>
                    </div>
                    <div id="test-swipe-1">
                        <%--<%@include file="recommendations.jsp" %>--%>
                    </div>
                    <div id="test-swipe-3">
                    </div>
                    <div id="test-swipe-4">
                        <%@include file="results.jsp" %>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:redirect url="index.jsp"/>
                </c:otherwise>
            </c:choose>
            <script src="materialize/js/index.js"></script>
            <script src="materialize/js/searchenable.js"></script>
        </main>
        <!--<script src="materialize/js/getnotifications.js"></script>-->
    </body>
</html>
