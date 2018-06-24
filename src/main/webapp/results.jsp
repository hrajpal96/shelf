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
            <%--<%@include file="basetemplate.jsp" %>--%>
            <%@include file="cachecontroller.jsp" %>
        </header>

        <main>

            <br>
            <%                ArrayList<String> booknames = (ArrayList<String>) request.getServletContext().getAttribute("searchresult");
                if (booknames != null) {
            %>
            <script>
                $(document).ready(function () {
                    $('ul.tabs').tabs('select_tab', 'test-swipe-4');
                });
            </script>
            <%}%>
            <div id="test-swipe-2">
                <%--<%@include file="arrivals.jsp" %>--%>
            </div>

            <div id="test-swipe-1">
            </div>
            <div id="test-swipe-3">
            </div>
            <div class="container" style="width: 90%">
                <div class="row">
                    <div class="col s12 m9 l10" id="bodybox">
                        <%               try {
                                ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");
                                Connection con = conn.getConnection();
                                JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);
                                if (booknames != null) {
                        %>
                        <h5>Search Results for : </h5>
                        <div class="chip">
                            <%= request.getParameter("search")%>
                        </div>
                        <div class="divider"></div><br>

                        <%            for (String bookname : booknames) {
                                if (bookname.contains("'")) {
                                    bookname = bookname.replace("\'", "\\'");
                                }
                                System.out.println(bookname + "\n");
                                rowset.setCommand("SELECT * FROM book where bookName='" + bookname + "'");
                                rowset.execute();
                                System.out.println("SELECT Executed");
                                rowset.absolute(1);

                        %>

                        <div class="col s4 s4">
                            <div class="card medium hoverable">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="<%= rowset.getString("coverPath")%>">
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4"><%= rowset.getString(2)%><i class="material-icons right">more_vert</i></span>
                                    <a href="viewbook.do?bookid=<%= URLEncoder.encode(rowset.getString("bookid"), "UTF-8")%>">View Details</a>
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i><%= rowset.getString(2)%></span>
                                    <p><%= rowset.getString("author")%></p>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        } else if (request.getParameter("search") != null) {
                        %>
                        <h5>Sorry Couldn't find what you were looking for :(</h5><br>
                        <h5>Instead try searching for: </h5>
                        <%
                                }
                            } catch (SQLException e) {
                                log(e.getMessage());
                            }
                            request.getServletContext().removeAttribute("searchresult");
                        %>
                    </div>
                </div>
            </div>
            <jsp:include page="checksession.jsp"></jsp:include>
            <script src="materialize/js/index.js"></script>
        </main>
       
    </body>
</html>
