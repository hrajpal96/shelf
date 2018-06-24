<%-- 
    Document   : getNotifications
    Created on : 2 Jun, 2018, 12:25:38 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.shelf.session.UserBean"%>
<%@page import="javax.sql.rowset.JdbcRowSet"%>
<%@page import="com.sun.rowset.JdbcRowSetImpl"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="connectionproperties.ConnectionBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        ConnectionBean conn = (ConnectionBean) getServletContext().getAttribute("db");
        final JdbcRowSet rowSet = new JdbcRowSetImpl(conn.getConnection());
        UserBean user = (UserBean) (session.getAttribute("user"));
        rowSet.setCommand("SELECT COUNT(notification_id) from usernotifications where uid='" + user.getUID() + "' AND readstatus='false'");
        rowSet.execute();
        rowSet.absolute(1);
        if (rowSet != null) {
            System.out.println("RowSet is not empty");
            out.print(rowSet.getInt(1));
        } else {
            System.out.println("RowSet is Empty");
        }
    } catch (SQLException e) {
        System.out.println("Error: " + e.getMessage());
    }
%>
