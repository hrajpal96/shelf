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
        <main>
            <c:choose>
                <c:when test="${sessionScope.user ne null}">
                    <h3>Welcome, ${sessionScope.user.firstName}</h3>
                    <!--                <div id="test-swipe-1" class="col                         </div>-->
                    <!--                <div id="test-swipe-1">
                                        <div class="card col s12 "><center><h2>Your Recommendations</h2></center>
                    <% if (session.getAttribute("recommendations") != null) {

                    %>    
                    <%--<%@include file="generaterecommendations.jsp" %>--%>
                    <%                            }
                    %>
            </div>
        </div>-->
                    <div id="test-swipe-1">
                        <c:choose>
                            <c:when test="${sessionScope.user ne null}">

                                <!--<div class="col s12 cards-container">-->
                                <%                            log("Recommendations Page");
                                    if (session.getAttribute("Recommendations") != null) {
                                        System.out.println("If is true");
                                        try {
                                            ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");

                                            Connection con = conn.getConnection();

                                            JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);
                                %>
                                <!--                <script>
                                                    $(document).ready(
                                                            function () {
                                                                setInterval(function () {
                                                                    $('#new').removeClass("active");
                                                                    $('#recommendations').addClass("active");
                                                                },
                                                                        2000);
                                                            });
                                
                                                </script>-->           
                                <br>
                                <br>
                                <br>
                                <br>
                                <h2>Your Rated Items</h2>
                                <div class="row">
                                    <%
                                        FastIDSet ratedItems = (FastIDSet) session.getAttribute("ratedItems");
                                        Iterator itr = ratedItems.iterator();
                                        while (itr.hasNext()) {
                                            rowset.setCommand("SELECT bookName,author,averageRating,coverPath from book where bookid=" + itr.next().toString());
                                            rowset.execute();
                                            if (rowset.next()) {
                                                rowset.absolute(1);

                                    %>
                                    <div class="collection">

                                        <a href="#" class="collection-item">
                                            <div  class="collection-item avatar">
                                                <img src="<%= rowset.getString("coverPath")%>" alt="" class="circle">
                                                <span class="title"><%= rowset.getString(1)%></span>
                                                <p><%= rowset.getString("author")%> <br>
                                                    Second Line
                                                </p>
                                                <!--<a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>-->
                                            </div>
                                        </a>
                                    </div>
                                    <!--                        <div class="col s2 s2">
                                                                <div class="card">
                                                                    <div class="card-image waves-effect waves-block waves-light">
                                                                        <img class="activator" src="<%= rowset.getString("coverPath")%>">
                                                                    </div>
                                                                    <div class="card-content">
                                                                        <span class="card-title activator grey-text text-darken-4"><%= rowset.getString(1)%><i class="material-icons right">more_vert</i></span>
                                                                        <p><a href="#">View Details</a></p>
                                                                    </div>
                                                                    <div class="card-reveal">
                                                                        <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i><%= rowset.getString(1)%></span>
                                                                        <p><%= rowset.getString("author")%></p>
                                                                    </div>
                                                                </div>
                                                            </div>-->
                                    <%
                                            }
                                        }
                                        List< RecommendedItem> list = (List<RecommendedItem>) session.getAttribute("Recommendations");
                                        Iterator<RecommendedItem> iter = list.iterator();
                                        int size = list.size() - 1;
                                    %>
                                </div>
                                <div class="row">
                                    <div id="recommendationlist">

                                        <%
                                            while (iter.hasNext()) {
                                                RecommendedItem item = iter.next();
                                                rowset.setCommand("SELECT bookName,author,averageRating,coverPath from book where bookid=" + item.getItemID());
                                                rowset.execute();
                                                if (rowset.next()) {
                                                    rowset.absolute(1);
                                                    //                        String imagepath = rowset.getString("coverPath");
                                        %>
                                        <div class="col s2 s2">
                                            <div class="card">
                                                <div class="card-image waves-effect waves-block waves-light">
                                                    <img class="activator" src="<%= rowset.getString("coverPath")%>">
                                                </div>
                                                <div class="card-content">
                                                    <span class="card-title activator grey-text text-darken-4"><%= rowset.getString(1)%><i class="material-icons right">more_vert</i></span>
                                                    <p><a href="#">View Details</a></p>
                                                </div>
                                                <div class="card-reveal">
                                                    <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i><%= rowset.getString(1)%></span>
                                                    <p><%= rowset.getString("author")%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <%                        }
                                            }
                                        %>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <%
                                            } catch (SQLException e) {
                                                System.out.println(e);
                                            }
                                        } else {
                                        %>

                                    </div>
                                    <script>
                                        var refreshId = setInterval(function () {
                                            window.opener.location.reload();
                                            window.close();
                                        }, 4000);
                                        $.ajaxSetup({cache: false});

                                    </script>
                                    <div class="preloader-wrapper big active" id="spinnercon">
                                        <div class="spinner-layer spinner-red">
                                            <div class="circle-clipper left">
                                                <div class="circle"></div>
                                            </div><div class="gap-patch">
                                                <div class="circle"></div>
                                            </div><div class="circle-clipper right">
                                                <div class="circle"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        //                        response.setHeader("Refresh", "5");
                                        //                        System.out.println("Inside else...");
                                    %>
                                    <%                        }
                                    %>
                                </div>    
                            </c:when>
                        </c:choose>
                    </div>
                    <div id="test-swipe-2">
                        Hello World
                    </div>

                </c:when>
                <c:otherwise>
                    <c:redirect url="index.jsp"/>
                </c:otherwise>
            </c:choose>
        </main>
        <script src="js/zxcvbn.js"></script>
    </body>
</html>
