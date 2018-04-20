<%-- 
    Document   : cachecontroller
    Created on : 17 Mar, 2018, 1:18:42 PM
    Author     : Lenovo
--%>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
