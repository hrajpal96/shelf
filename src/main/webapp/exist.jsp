<%-- 
    Document   : exist
    Created on : 18 Mar, 2018, 11:39:49 PM
    Author     : Lenovo
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = (Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/shelf", "root", "shelf123@");
        Statement ps = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        String emailID=request.getParameter("emailID");
        ResultSet res = ps.executeQuery("SELECT  * FROM ROOT.userdetails WHERE EMAILID like \'" +emailID+"\'");

        if (res.first()) {
            out.print("email-ID already registered");
        } else {
            out.print("Available for registration");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>