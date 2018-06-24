<%-- 
    Document   : notifications
    Created on : May 5, 2018, 4:22:21 PM
    Author     : Asus
--%>

<%@page import="com.shelf.session.UserBean"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.sql.rowset.JdbcRowSet"%>
<%@page import="com.sun.rowset.JdbcRowSetImpl"%>
<%@page import="connectionproperties.ConnectionBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="basetemplate.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notifications</title>
    </head>
    <body>
        <main>
            <div class=" lighten-5">
                <div class="col s0.8" >&nbsp;</div>
                <div class="row">
                    <div class="col s0.8" >&nbsp</div>
                    <%@include file="templates/leftMyProfile.html" %>

                    <div class="col s0.1" >&nbsp</div>
                    <div class="col s8 white">
                        <div class="row">


                            <div class="col s10" >&nbsp</div>
                            <div class="col s12">
                                <br>
                                <%
                                    try {
                                        ConnectionBean conn = (ConnectionBean) getServletContext().getAttribute("db");
                                        final JdbcRowSet rowSet = new JdbcRowSetImpl(conn.getConnection());
                                        UserBean user = (UserBean) (session.getAttribute("user"));
                                        rowSet.setCommand("SELECT notification_message,generatedtimestamp,readstatus from usernotifications where uid='" + user.getUID() + "' AND readstatus='false'");
                                        rowSet.execute();
                                        rowSet.absolute(1);
                                        if (rowSet != null) {
                                %>
                                <ul class="collection">

                                    <%
                                        while (rowSet.next()) {
                                    %>
                                    <li class="collection-item">
                                        <div  class="collection-item avatar">
                                            <img src="" alt="" class="materialboxed circle">
                                            <span class="title flow-text"><%= rowSet.getString("notification_message")%></span><br>
                                            <p><%= rowSet.getTimestamp("generatedtimestamp")%></p>
                                            <a href="">Read</a>
                                            <p><div  class="secondary-content flow-text"><i class="material-icons right">notifications</i></div></p>
                                        </div>
                                    </li>    
                                    <%      }
                                            } else {
                                                System.out.println("RowSet is Empty");
                                            }
                                        } catch (SQLException e) {
                                            System.out.println("Error: " + e.getMessage());
                                        }
                                    %>
                                </ul>
                            </div>
                        </div>
                    </div>   <!--  My profile-->


                    <div class=" lighten-5" >&nbsp;</div>
                    <div class="col s12" >&nbsp;</div>
                </div>
            </div>                                        
            <script type="text/javascript" src="js/myProfile.js"></script>
            <script type="text/javascript" src="materialize/js/index.js"></script>
        </main>
    </body>
</html>
