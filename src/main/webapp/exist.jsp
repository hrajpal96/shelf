<%-- 
    Document   : exist
    Created on : 18 Mar, 2018, 11:39:49 PM
    Author     : Lenovo
--%>
<%@page import="connectionproperties.ConnectionBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");

        Connection con = conn.getConnection();
        Statement ps = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        String emailID = request.getParameter("emailID");
        ResultSet res = ps.executeQuery("SELECT uid FROM user WHERE emailID like \'" + emailID + "\'");

        if (res.first()) {
            out.print("email-ID already registered");
        } else {
            out.print("Available for registration");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>