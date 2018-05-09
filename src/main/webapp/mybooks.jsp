<%-- 
    Document   : mybooks
    Created on : 25 Apr, 2018, 12:21:13 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.rowset.JdbcRowSetImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="connectionproperties.ConnectionBean"%>
<%@page import="org.apache.mahout.cf.taste.model.PreferenceArray"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.mahout.cf.taste.recommender.RecommendedItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%      try {
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
                                PreferenceArray ratings = (PreferenceArray) session.getAttribute("ratings");
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
                    <%
                        } catch (SQLException e) {
                            System.out.println(e);
                        }
                    %>
                    </body>
                    </html>
