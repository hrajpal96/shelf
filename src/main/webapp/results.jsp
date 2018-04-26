<%-- 
    Document   : results
    Created on : 22 Apr, 2018, 11:15:01 AM
    Author     : Lenovo
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.rowset.JdbcRowSetImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="connectionproperties.ConnectionBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <header>
            <%@include file="basetemplate.jsp" %>
            <%@include file="cachecontroller.jsp" %>
        </header>
        <main>
            <br>
            <div class="container" style="width: 90%">
                <div class="row">
                    <div class="col s12 m9 l10" id="bodybox">
                        <h5>Search Results</h5><br>
                        <div class="divider"></div><br>
                        <%                ArrayList<String> booknames = (ArrayList<String>) request.getServletContext().getAttribute("searchresult");
                            try {
                                ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");
                                Connection con = conn.getConnection();
                                JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);

                                for (String bookname : booknames) {
                                    System.out.println(bookname.toString());
                                    rowset.setCommand("SELECT * FROM book where bookName='" + bookname + "'");
                                    rowset.execute();
                                    System.out.println("SELECT Executed");
                                    rowset.absolute(1);

                        %>
                        <div class="col s3">
                            <div class="card medium hoverable">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="<%= rowset.getString("coverPath")%>">
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4"><%= rowset.getString(2)%><i class="material-icons right">more_vert</i></span>
                                    <a href="productdetails.jsp?bookid=<%= URLEncoder.encode(rowset.getString("bookid"), "UTF-8")%>">View Details</a>
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i><%= rowset.getString(2)%></span>
                                    <p><%= rowset.getString("author")%></p>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            } catch (SQLException e) {
                                log(e.getMessage());
                            }
                        %>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
