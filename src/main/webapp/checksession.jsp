<%-- 
    Document   : checksession
    Created on : 28 Apr, 2018, 9:13:24 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.user eq null}">
    <jsp:include page="loginmodal.jsp" ></jsp:include>
    <jsp:include page="signuphandler.jsp" ></jsp:include>
</c:if>