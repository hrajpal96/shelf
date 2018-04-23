<%-- 
    Document   : generaterecommendations
    Created on : 23 Mar, 2018, 1:00:41 PM
    Author     : Lenovo
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.mahout.cf.taste.model.PreferenceArray"%>
<%@page import="org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator"%>
<%@page import="org.apache.mahout.cf.taste.impl.common.LongPrimitiveArrayIterator"%>
<%@page import="org.apache.mahout.cf.taste.impl.common.FastIDSet"%>
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
    </head>
    <body>
        <%@include file="cachecontroller.jsp" %>
        <!--<header> </header>-->
        <br>

        <br>
        <br>
        <main>

            <c:choose>
                <c:when test="${sessionScope.user ne null}">
                    <%                        
                        if (session.getAttribute("Recommendations") != null) {
                            log("Recommendations Page");
                            try {
                                ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");

                                Connection con = conn.getConnection();

                                JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);
                    %>
                    <div class="container" style="width: 90%">
                        <div class="row">
                            <h2>My Rated Books</h2>
                            <div class="col s12 m9 l10" id="bodybox">
                                <div id="ratings" class="section scrollspy">
                                    <p> 
                                        <%
//                                            FastIDSet ratedItems = (FastIDSet) session.getAttribute("ratedItems");
                                            PreferenceArray ratings = (PreferenceArray) session.getAttribute("ratings");
//                                            Iterator itr = ratedItems.iterator();
                                            int i = 0;
                                            while (i < ratings.length()) {

                                                rowset.setCommand("SELECT bookName,author,averageRating,coverPath,bookid from book where bookid=" + ratings.getItemID(i));
                                                rowset.execute();
                                                if (rowset.next()) {
                                                    rowset.absolute(1);

                                        %>
                                    <div class="collection">
                                        <li class="collection-item">
                                            <div  class="collection-item avatar">
                                                <img src="<%= rowset.getString("coverPath")%>" alt="" class="materialboxed circle">
                                                <span class="title flow-text"><%= rowset.getString(1)%></span><br>
                                                <p><%= rowset.getString("author")%></p>
                                                <a href="productdetails.jsp?bookid=<%= URLEncoder.encode(rowset.getString("bookid"), "UTF-8")%>">View Details</a>
                                                <p><div  class="secondary-content flow-text"><%= ratings.getValue(i)%><i class="material-icons right">grade</i></div></p>
                                            </div>
                                        </li>
                                    </div>
                                    <%
                                            }
                                            i++;
                                        }%>
                                    </p>
                                </div>
                                <div id="recommendations" class="section scrollspy">
                                    <div class="card large grey lighten-4">
                                        <h2 class="center-align">My Recommendations</h2>
                                        <p><%
                                            List< RecommendedItem> list = (List<RecommendedItem>) session.getAttribute("Recommendations");
                                            Iterator<RecommendedItem> iter = list.iterator();
                                            int size = list.size() - 1;
                                            while (iter.hasNext()) {
                                                RecommendedItem item = iter.next();
                                                rowset.setCommand("SELECT bookName,author,averageRating,coverPath,bookid from book where bookid=" + item.getItemID());
                                                rowset.execute();
                                                if (rowset.next()) {
                                                    rowset.absolute(1);
                                                    //                        String imagepath = rowset.getString("coverPath");
                                            %>
                                        <div class="col s3">
                                            <div class="card medium hoverable">
                                                <div class="card-image waves-effect waves-block waves-light">
                                                    <img class="activator" src="<%= rowset.getString("coverPath")%>">
                                                </div>
                                                <div class="card-content">
                                                    <span class="card-title activator grey-text text-darken-4"><%= rowset.getString(1)%><i class="material-icons right">more_vert</i></span>
                                                    <p><a href="productdetails.jsp?bookid=<%= URLEncoder.encode(rowset.getString("bookid"), "UTF-8")%>">View Details</a></p>
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
                                        </p>

                                    </div>
                                </div>
                                <%
                                    } catch (SQLException e) {
                                        System.out.println(e);
                                    }
                                %>
                            </div>
                            <div class="col hide-on-med-and-down m3 l1">
                                <ul id="toc" class="section table-of-contents black-text">
                                    <li><a href="#ratings" class="black-text">My Ratings</a></li>
                                    <li><a href="#recommendations" class="black-text">Recommendations</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%                        } else {

                        }
                    %>
                </c:when>
                <c:otherwise>
                    <c:redirect url="index.jsp"/>
                </c:otherwise>
            </c:choose>
        </main>
    </body>
</html>