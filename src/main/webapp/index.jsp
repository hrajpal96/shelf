<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Shelf</title>

    </head>
    <body onload="setTimeout('redirect()', 100)">
        <header><%@include file="basetemplate.jsp" %></header>
        <main>
            <c:choose>
                <c:when test="${sessionScope.user eq null}">
                    <%@include file="cachecontroller.jsp" %>
                    <div class="slider fullscreen">
                        <ul class="slides">
                            <li>
                                <img src="materialize/images/para1.jpg"> <!-- random image -->
                                <div class="caption center-align">
                                    <h3>An app that is completely focused to improve user's recommendations.</h3>
                                    <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                </div>
                            </li>
                            <li>
                                <img src="materialize/images/para.jpg"> <!-- random image -->
                                <div class="caption left-align">
                                    <h3>Left Aligned Caption</h3>
                                    <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                </div>
                            </li>
                            <li>
                                <img src="materialize/images/parallax1.jpg"> <!-- random image -->
                                <div class="caption right-align">
                                    <h3>Right Aligned Caption</h3>
                                    <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                </div>
                            </li>
                            <li>
                                <img src="materialize/images/parallax1_1.png"> <!-- random image -->
                                <div class="caption center-align">
                                    <h3>This is our big Tagline!</h3>
                                    <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <%@include file="loginmodal.jsp" %>
                    <%@include file="signuphandler.jsp" %>
                </c:when>
                <c:otherwise>
                    <c:redirect url="success.jsp"/>
                </c:otherwise>
            </c:choose>
        </main>
        <!--<script src="js/zxcvbn.js"></script>-->
    </body>
</html>         