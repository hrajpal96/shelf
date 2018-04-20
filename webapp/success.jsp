<%-- 
    Document   : success
    Created on : 13 Mar, 2018, 4:13:52 PM
    Author     : Lenovo
--%>

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
        <%@include file="basetemplate.jsp" %>
    </head>
    <body>
        <%@include file="cachecontroller.jsp" %>
        <c:choose>
            <c:when test="${sessionScope.user ne null}">
                <h3>Welcome, ${sessionScope.user.firstName}</h3>
                <!--                <div id="test-swipe-1" class="col                         </div>-->
<!--                <div id="test-swipe-1">
                    <div class="card col s12 "><center><h2>Your Recommendations</h2></center>
                            <% if (session.getAttribute("recommendations") != null) {

                            %>    
                            <%@include file="generaterecommendations.jsp" %>
                            <%                            }
                            %>
                    </div>
                </div>-->
                <div id="test-swipe-2">
                    Hello World
                </div>

            </c:when>
            <c:otherwise>
                <c:redirect url="index.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
</html>
