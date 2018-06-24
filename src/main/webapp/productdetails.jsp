<%-- 
    Document   : productdetails.jsp
    Created on : 4 Apr, 2018, 1:50:34 AM
    Author     : Lenovo
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.mahout.cf.taste.recommender.RecommendedItem"%>
<%@page import="com.shelf.search.BookBean"%>
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
    <header>        
        <jsp:include page="basetemplate.jsp" ></jsp:include>
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
                    <div class="col s12 m12 l10" id="bodybox">
                    <%
//                        String bookID = request.getParameter("bookid");
//                        try {
//                            ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");
//                            Connection con = conn.getConnection();
//                            JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);
//                            rowset.setCommand("SELECT bookName,author,averageRating,coverPath,bookid from book where bookid=" + bookID);
//                            rowset.execute();
//                            rowset.absolute(1);
//                            System.out.println(rowset.getDouble("averageRating"));
                        BookBean bookdetails = null;
                        if (request.getAttribute("bookdetails") != null) {
                            System.out.println("In ProductDetails page");
                            bookdetails = (BookBean) request.getAttribute("bookdetails");
                        }
                    %>
                    <br>
                    <br>
                    <center>

                        <img class="materialboxed responsive-img" width="350" height="450" src="<%= bookdetails.getCoverpath()%>">
                        <h4><%= bookdetails.getBookname()%></h4>
                        <h4><%= bookdetails.getAuthor()%></h4>
                        <button class="btn waves-effect waves-light blue darken-5 btn-primary center-align" 
                                type="submit"  name="addtocart">Add To Cart<i class="material-icons left">shopping_cart</i> </button>
                        <br>
                        <br>
                        <div class="container">
                            <div class="hreview-aggregate">
                                <div class="row">
                                    <div class="col s12 m6 l6">
                                        <meta itemprop="worstRating" content="1">
                                        <meta itemprop="bestRating" content="5">
                                        <meta itemprop="reviewCount" content="1">
                                        <div class="row">
                                            <div class="score col s12">
                                                <%= bookdetails.getAverageRating()%>
                                            </div>
                                            <%
                                                if (bookdetails.getTotalratings() != null) {
                                                    System.out.println(bookdetails.getTotalratings().toString());
                                                }
                                            %>
                                            <form name="ratingsform" action="updaterating.do">
                                                <input type="hidden" name="bookid" value="<%= bookdetails.getBookID()%>">
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
                                                    <input type="hidden" name="bookid" value="<%= bookdetails.getBookID()%>">
                                                    <input type="hidden" name="uid" value="<%= uid%>">

                                                    <button class="btn waves-effect waves-light red accent-4 btn-primary center-align" 
                                                            type="submit"  onclick="checkNotifications()" name="action">Submit<i class="material-icons left">rate_review</i> </button>
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
                                                <% if (bookdetails.getTotalratings().get(5) != null) {%>
                                                <%= bookdetails.getTotalratings().get(5)%>
                                                <% } else { %>
                                                None Yet
                                                <% } %>

                                            </span>
                                        </div>
                                        <div class="rating-bar-container four">
                                            <span class="bar-label">
                                                <span class="star-tiny">
                                                </span> 4
                                            </span>
                                            <span class="bar">
                                            </span>
                                            <span class="bar-number">
                                                <% if (bookdetails.getTotalratings().get(4) != null) {%>
                                                <%= bookdetails.getTotalratings().get(4)%>
                                                <% } else { %>
                                                None Yet
                                                <% } %>
                                            </span>
                                        </div>
                                        <div class="rating-bar-container tree">
                                            <span class="bar-label">
                                                <span class="star-tiny">
                                                </span> 3
                                            </span>
                                            <span class="bar">
                                            </span>
                                            <span class="bar-number">
                                                <% if (bookdetails.getTotalratings().get(3) != null) {%>
                                                <%= bookdetails.getTotalratings().get(3)%>
                                                <% } else { %>
                                                None Yet
                                                <% } %>
                                            </span>
                                        </div>
                                        <div class="rating-bar-container two">
                                            <span class="bar-label">
                                                <span class="star-tiny">
                                                </span> 2
                                            </span>
                                            <span class="bar">
                                            </span>
                                            <span class="bar-number">
                                                <% if (bookdetails.getTotalratings().get(2) != null) {%>
                                                <%= bookdetails.getTotalratings().get(2)%>
                                                <% } else { %>
                                                None Yet
                                                <% } %>
                                            </span>
                                        </div>
                                        <div class="rating-bar-container one">
                                            <span class="bar-label">
                                                <span class="star-tiny">
                                                </span> 1
                                            </span>
                                            <span class="bar">
                                            </span>
                                            <span class="bar-number">
                                                <% if (bookdetails.getTotalratings().get(1) != null) {%>
                                                <%= bookdetails.getTotalratings().get(1)%>
                                                <% } else { %>
                                                None Yet
                                                <% } %>
                                            </span>
                                        </div>
                                    </div>
                                    <% //}


                                    %>
                                </div>
                                <div id="ratingalert"></div>
                            </div>
                        </div>

                        <h5> Date First Available: <%= bookdetails.getFirst_available()%> </h5>
                    </center>
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
                <div class="card col hide-on-med-and-down s4 l2">
                    <%  try {
                            ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");

                            Connection con = conn.getConnection();

                            JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);
                            List< RecommendedItem> list = (List<RecommendedItem>) session.getAttribute("similarbooks");
                            Iterator<RecommendedItem> iter = list.iterator();
                            int size = list.size() - 1;
                            if (iter != null) {
                    %>
                    <h4 class="text-center">Similar Books</h4>
                    <%
                        }
                        while (iter.hasNext()) {
                            RecommendedItem item = iter.next();
                            rowset.setCommand("SELECT bookName,author,averageRating,coverPath,bookid from book where bookid=" + item.getItemID());
                            rowset.execute();
                            if (rowset.next()) {
                                String imagepath = rowset.getString("coverPath");
                    %>
                    <div class="card hoverable">
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
                    <%
                                }
                            }
                        } catch (SQLException e) {
                            System.out.println(e);
                        }
                    %>
                </div>
            </div>
        </div>
        <center>

        </center>
        <jsp:include page="checksession.jsp"></jsp:include>
    </main>
    <script>
        $(document).ready(function () {

            $('ul.tabs').tabs('select_tab', 'test-swipe-4');
        });
        

    });
    </script>
    <script src="materialize/js/index.js"></script>
</body>
</html>
