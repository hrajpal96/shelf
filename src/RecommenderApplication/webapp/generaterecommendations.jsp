<%-- 
    Document   : generaterecommendations
    Created on : 23 Mar, 2018, 1:00:41 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.rowset.JdbcRowSetImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="connectionproperties.ConnectionBean"%>
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
        <%@include file="basetemplate.jsp" %>        
    </head>
    <body>
        <%@include file="cachecontroller.jsp" %>
        <div id="test-swipe-1">
            <c:choose>
                <c:when test="${sessionScope.user ne null}">
                    <div class="row">
                        <!--<div class="col s12 cards-container">-->
                        <%                        System.out.println("TEST SWIPE 1");
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
                        <%
                            List< RecommendedItem> list = (List<RecommendedItem>) session.getAttribute("Recommendations");
                            Iterator<RecommendedItem> iter = list.iterator();
                            int size = list.size() - 1;
                        %>
                        <%
                            while (iter.hasNext()) {
                                RecommendedItem item = iter.next();
                                rowset.setCommand("SELECT bookName,author,averageRating,coverPath from book where bookid=" + item.getItemID());
                                rowset.execute();
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
                        %>

                        <%
                            } catch (SQLException e) {
                                System.out.println(e);
                            }
                        } else {
                        %>

                    </div>
                    <script>
                        var refreshId = setInterval(function () {
                            $(document).load('generaterecommendations.jsp');
                        }, 4000);
                        $.ajaxSetup({cache: false});

                    </script>
                    <div class="preloader-wrapper big active">
                        <div class="spinner-layer spinner-blue">
                            <div class="circle-clipper left">
                                <div class="circle"></div>
                            </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                        </div>

                        <div class="spinner-layer spinner-red">
                            <div class="circle-clipper left">
                                <div class="circle"></div>
                            </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                        </div>

                        <div class="spinner-layer spinner-yellow">
                            <div class="circle-clipper left">
                                <div class="circle"></div>
                            </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                        </div>

                        <div class="spinner-layer spinner-green">
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

                </c:when>
            </c:choose>
        </div>
    </body>
</html>


