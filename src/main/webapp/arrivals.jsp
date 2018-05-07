<%-- 
    Document   : arrivals.jsp
    Created on : 22 Apr, 2018, 4:49:32 PM
    Author     : Lenovo
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.rowset.JdbcRowSetImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="connectionproperties.ConnectionBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <main>
            <%
                try {
                    ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");

                    Connection con = conn.getConnection();

                    JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);
            %>
            <center><h2>New Arrivals</h2></center>
            <div class="container" >
                <center>
                    <!--<div class="card large">-->
                    <div class="carousel">
                        <%
                            rowset.setCommand("SELECT bookName,author,averageRating,coverPath,bookid from book order by RAND() LIMIT 10");
                            rowset.execute();
                            rowset.absolute(1);
                            while (rowset.next()) {
                        %>
                        <a class="carousel-item" href=""><img src="<%= rowset.getString("coverPath")%>"><%= rowset.getString("bookName")%></a>
                            <%
                                    }
                                } catch (SQLException e) {
                                    log(e.getMessage());
                                }
                            %>  
                    </div>
                    <!--</div>-->
                </center>
            </div>

        </main>
    </body>
</html>
