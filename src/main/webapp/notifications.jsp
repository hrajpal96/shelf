<%-- 
    Document   : notifications
    Created on : 6 May, 2018, 1:19:32 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notifications</title>
    </head>
    <body>
        <header>
            <%--<%@include file="basetemplate.jsp" %>--%>
            <%@include file="basetemplate.jsp" %>
            <%@include file="cachecontroller.jsp" %>
            <%@include file="checksession.jsp" %>
        </header>

        <main>
            <div class="col s0.8" >&nbsp;</div>
            <div class="row">
                <div class="col s0.8" >&nbsp</div>
                <%@include file="templates/leftMyProfile.html" %>
                <% if (session.getAttribute("isupdated") != null) {
                %>
                <style>
                    #toast-container {
                        top: auto !important;
                        right: auto !important;
                        bottom: 10%;
                        left:7%;  
                    }
                </style>
                <script>Materialize.toast('Successfully Updated', 2000, 'bottom')</script>
                <%
                        session.removeAttribute("isupdated");
                    }
                %>
                <div class="col s0.1" >&nbsp</div>
                <div class="card col s8">
                    <div class="col s10" >&nbsp</div>
                    <div class="col s12">
                        <ul class="collection">
                            <c:forEach var="notifs" items="${sessionScope.notification.message}">
                                <li class="collection-item">
                                    <h5 class="black-text ">${notifs.value}</h5>
                                    <p class="grey-text">
                                <fmt:formatDate value="${notifs.key}" pattern="dd MMM, yyyy" /> 

                                </p>
                                </li>
                            </c:forEach>
                        </ul>

                    </div>
                    <div class="col s12" >&nbsp;</div>
                </div>
                <script type="text/javascript" src="materialize/js/account.js"></script>
                <script src="materialize/js/index.js"></script>
        </main>
    </body>
</html>
