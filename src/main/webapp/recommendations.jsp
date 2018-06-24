<%-- 
    Document   : generaterecommendations
    Created on : 23 Mar, 2018, 1:00:41 PM
    Author     : Lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.shelf.session.UserBean"%>
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
        <jsp:include page="cachecontroller.jsp" ></jsp:include>
            <!--<header> </header>-->
            <main>

            <c:choose>
                <c:when test="${sessionScope.user ne null}">
                    <%                        if (session.getAttribute("Recommendations") != null) {
                            log("Recommendations Page");
                            try {
                                ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");

                                Connection con = conn.getConnection();

                                JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);
                                UserBean user = (UserBean) session.getAttribute("user");
                    %>
                    <div class="container" style="width: 90%">
                        <div class="row">
                            <% if ((List<RecommendedItem>)session.getAttribute("recommendations") == null) {
                            %>
                            <center>
                                <img src="materialize/images/products--ratings-reviews.png"/><br>
                                <h5>Please rate at least 3 books to start getting personalized recommendations</h5>
                                <div class="progress" style="width: 20%">
                                    <div class="determinate blue" style="width: 10%; height: 110%"></div>
                                </div>
                            </center>
                            <%
                                }%>
                            <div class="col s12 m9 l10" id="bodybox">
                                <h2>Based on Preferences</h2>
                                <div class="row">
                                    <div id="ratings" class="section scrollspy">
                                        <p> <%                                        PreferenceArray ratings = (PreferenceArray) session.getAttribute("ratings");
                                            rowset.setCommand("SELECT preferenceID from userpreferences where uid=" + user.getUID());
                                            rowset.execute();
                                            rowset.absolute(0);
                                            ArrayList<Integer> preferences = new ArrayList<>();
                                            while (rowset.next()) {
                                                preferences.add(rowset.getInt("preferenceID"));
                                            }
                                            for (Integer preference : preferences) {
                                                rowset.setCommand("SELECT bookName,author,averageRating,coverPath,bookid from book where preferenceID=" + preference + " order by RAND() LIMIT 3");
                                                rowset.execute();
                                                rowset.absolute(1);
                                                while (rowset.next()) {

                                            %>
                                        <div class="col m4">
                                            <div class="card medium hoverable">
                                                <div class="card-image waves-effect waves-block waves-light">
                                                    <img class="activator" src="<%= rowset.getString("coverPath")%>">
                                                </div>
                                                <div class="card-content">
                                                    <span class="card-title activator grey-text text-darken-4"><%= rowset.getString(1)%><i class="material-icons right">more_vert</i></span>
                                                    <a href="viewbook.do?bookid=<%= URLEncoder.encode(rowset.getString("bookid"), "UTF-8")%>">View Details</a>
                                                </div>
                                                <div class="card-reveal">
                                                    <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i><%= rowset.getString(1)%></span>
                                                    <p><%= rowset.getString("author")%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                }
                                            }

                                        %>
                                        </p>
                                    </div>
                                </div>
                                <div id="recommendations" class="section scrollspy">

                                    <p><%                                        List< RecommendedItem> list = (List<RecommendedItem>) session.getAttribute("Recommendations");
                                        Iterator<RecommendedItem> iter = list.iterator();
                                        int size = list.size() - 1;
                                        if (iter != null) {
                                        %>
                                    <h2 class="text-center">Users also read</h2>

                                    <%
                                        }
                                        while (iter.hasNext()) {
                                            RecommendedItem item = iter.next();
                                            rowset.setCommand("SELECT bookName,author,averageRating,coverPath,bookid from book where bookid=" + item.getItemID());
                                            rowset.execute();
                                            if (rowset.next()) {
                                                String imagepath = rowset.getString("coverPath");
                                    %>
                                    <div class="col m4">
                                        <div class="card medium hoverable">
                                            <div class="card-image waves-effect waves-block waves-light">
                                                <img class="activator" src="<%= rowset.getString("coverPath")%>">
                                            </div>
                                            <div class="card-content">
                                                <span class="card-title activator grey-text text-darken-4"><%= rowset.getString(1)%><i class="material-icons right">more_vert</i></span>
                                                <a href="viewbook.do?bookid=<%= URLEncoder.encode(rowset.getString("bookid"), "UTF-8")%>">View Details</a>
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
                                <%
                                    } catch (SQLException e) {
                                        System.out.println(e);
                                    }
                                %>
                            </div>
                            <div class="col hide-on-med-and-down m3 l1">
                                <ul id="toc" class="section table-of-contents">
                                    <li><a href="#ratings" >Preference Based</a></li>
                                    <li><a href="#recommendations" >Similar Users Read</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    %>
                </c:when>
                <c:otherwise>
                    <c:redirect url="index.jsp"/>
                </c:otherwise>
            </c:choose>
        </main>

        <script>
            $(document).ready(function () {
                $('.materialboxed').materialbox();
            });
        </script>
        <script src="materialize/js/searchenable.js"></script>
    </body>
</html>