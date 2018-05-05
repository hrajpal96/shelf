<%-- 
    Document   : productdetails.jsp
    Created on : 4 Apr, 2018, 1:50:34 AM
    Author     : Lenovo
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel"%>
<%@page import="org.apache.mahout.cf.taste.impl.model.jdbc.ReloadFromJDBCDataModel"%>
<%@page import="org.apache.mahout.cf.taste.model.DataModel"%>
<%@page import="com.shelf.session.UserBean"%>
<%@page import="com.sun.rowset.JdbcRowSetImpl"%>
<%@page import="javax.sql.rowset.JdbcRowSet"%>
<%@page import="connectionproperties.ConnectionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Details</title>
    </head>
    <body>
        <header>    
        </header>
        <br>
        <br>
        <br>
        <br>
        <br>
        <%            int uid = 0;
            UserBean user = (UserBean) session.getAttribute("user");
            if (user != null) {
                uid = user.getUID();
            } else {

            }
        %>
    <c:choose>
        <c:when test="${sessionScope.user ne null}">
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
    <header>        <jsp:include page="basetemplate.jsp" ></jsp:include>
        <jsp:include page="cachecontroller.jsp" ></jsp:include></header>
        <main>


            <div id="test-swipe-2">
            </div>
            <div id="test-swipe-1">
            </div>
            <div id="test-swipe-3">
            </div>
            <div id="test-swipe-4">
            </div>


            <div class="container" style="width: 90%">
                <div class="row">
                    <div class="col s12 m9 l10" id="bodybox">
                        <center>
                        <%
                            String bookID = request.getParameter("bookid");
                            try {
                                ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");
                                Connection con = conn.getConnection();
                                JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);
                                rowset.setCommand("SELECT bookName,author,averageRating,coverPath,bookid from book where bookid=" + bookID);
                                rowset.execute();
                                rowset.absolute(1);
                                System.out.println(rowset.getDouble("averageRating"));
                        %>
                        <br>
                        <br>
                        <div class="row">
                            <img class="materialboxed responsive-img" width="350" height="450" src="<%= rowset.getString("coverPath")%>">
                            <h4><%= rowset.getString("bookName")%></h4>
                            <h4><%= rowset.getString("author")%></h4>
                        </div>
                    </center>
                    <div class="container">
                        <div class="hreview-aggregate">
                            <div class="row">
                                <div class="col s12 m6 l6">
                                    <meta itemprop="worstRating" content="1">
                                    <meta itemprop="bestRating" content="5">
                                    <meta itemprop="reviewCount" content="1">
                                    <div class="row">
                                        <div class="score col s12">
                                            <%= rowset.getDouble("averageRating")%>
                                        </div>
                                        <% rowset.setCommand("SELECT preference,COUNT(*) from taste_preferences where item_id=" + bookID + " GROUP BY preference");
                                            rowset.execute();
                                            if (rowset.next()) {
                                                rowset.absolute(5);
                                        %>
                                        <form name="ratingsform" action="updaterating.do">
                                            <input type="hidden" name="bookid" value="<%= URLEncoder.encode(bookID, "UTF-8")%>">
                                            <div class="rating-stars col s12">
                                                <input type="radio" name="stars" id="star-null">
                                                <input type="radio" name="stars" id="star-1" saving="1" data-start="1" value="1" checked="" onclick="">
                                                <input type="radio" name="stars" id="star-2" saving="2" data-start="2" value="2" checked="" onclick="">
                                                <input type="radio" name="stars" id="star-3" saving="3" data-start="3" value="3" checked="" onclick="">
                                                <input type="radio" name="stars" id="star-4" saving="4" data-start="4" value="4" checked="" onclick="">
                                                <input type="radio" name="stars" id="star-5" saving="5" value="5" checked="">
                                                <section>
                                                    <label for="star-1">
                                                        <svg width="255" height="240" viewBox="0 0 51 48">
                                                        <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                                        </svg>
                                                    </label>
                                                    <label for="star-2">
                                                        <svg width="255" height="240" viewBox="0 0 51 48">
                                                        <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                                        </svg>
                                                    </label>
                                                    <label for="star-3">
                                                        <svg width="255" height="240" viewBox="0 0 51 48">
                                                        <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                                        </svg>
                                                    </label>
                                                    <label for="star-4">
                                                        <svg width="255" height="240" viewBox="0 0 51 48">
                                                        <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                                        </svg>
                                                    </label>
                                                    <label for="star-5">
                                                        <svg width="255" height="240" viewBox="0 0 51 48">
                                                        <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                                        </svg>
                                                    </label>
                                                </section>
                                            </div>

                                            <div class="reviews-stats col s12">
                                                <span class="reviewers-small"></span>
                                                <span class="reviews-num">
                                                    1
                                                </span> total
                                            </div><br><br>
                                            <center>
                                                <br>
                                                <br>
                                                <br>
                                                <br>
                                                <input type="hidden" name="bookid" value="<%= request.getParameter("bookid")%>">
                                                <input type="hidden" name="uid" value="<%= uid%>">
                                                <button class="btn waves-effect waves-light red accent-4 btn-primary center-align" 
                                                        type="submit"  name="action">Submit<i class="material-icons left">rate_review</i> </button>
                                            </center>
                                        </form>
                                    </div>
                                </div>
                                <div class="rating-histogram col s12 m6 l6">
                                    <div class="rating-bar-container five">
                                        <span class="bar-label">
                                            <span class="star-tiny">
                                            </span> 5
                                        </span>
                                        <span class="bar">
                                        </span>
                                        <span class="bar-number">
                                            <%=rowset.getInt(2)%>

                                        </span>
                                    </div>
                                    <% rowset.absolute(4);%>
                                    <div class="rating-bar-container four">
                                        <span class="bar-label">
                                            <span class="star-tiny">
                                            </span> 4
                                        </span>
                                        <span class="bar">
                                        </span>
                                        <span class="bar-number">
                                            <%=rowset.getInt(2)%>
                                        </span>
                                    </div>
                                    <% rowset.absolute(3);%>
                                    <div class="rating-bar-container tree">
                                        <span class="bar-label">
                                            <span class="star-tiny">
                                            </span> 3
                                        </span>
                                        <span class="bar">
                                        </span>
                                        <span class="bar-number">
                                            <%= rowset.getInt(2)%>
                                        </span>
                                    </div>
                                    <% rowset.absolute(2);%>
                                    <div class="rating-bar-container two">
                                        <span class="bar-label">
                                            <span class="star-tiny">
                                            </span> 2
                                        </span>
                                        <span class="bar">
                                        </span>
                                        <span class="bar-number">
                                            <%= rowset.getInt(2)%>
                                        </span>
                                    </div>
                                    <% rowset.absolute(1);%>
                                    <div class="rating-bar-container one">
                                        <span class="bar-label">
                                            <span class="star-tiny">
                                            </span> 1
                                        </span>
                                        <span class="bar">
                                        </span>
                                        <span class="bar-number">
                                            <%= rowset.getInt(2)%>
                                        </span>
                                    </div>
                                </div>
                                <%}
                                    } catch (SQLException e) {
                                        log(e.getMessage());
                                    }
                                %>
                            </div>
                            <div id="ratingalert"></div>
                        </div>
                    </div>
                    <div class="divider black-text"id="sidediv"></div>
                    <style>
                        #sidediv{
                            position:absolute;
                            left:50%;
                            top:10%;
                            bottom:10%;
                            border-left:1px solid white;
                        }
                    </style>
                </div> 

            </div>            
        </div>
        <jsp:include page="checksession.jsp"></jsp:include>
    </main>
    <script>
        $(document).ready(function () {

            $('ul.tabs').tabs('select_tab', 'test-swipe-4');
        });
    </script>
    <script src="materialize/js/index.js"></script>
</body>
</html>
