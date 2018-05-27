<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Shelf</title>

    </head>
    <body onload="setTimeout('redirect()', 100)" >
        <header>
            <div class="hide-on-med-and-down">
                <jsp:include page="basetemplate.jsp" ></jsp:include>
                </div>
            </header>
            <main>
                <div class="hide-on-med-and-down">
                <c:choose>
                    <c:when test="${sessionScope.user eq null}">
                        <%@include file="cachecontroller.jsp" %>
                        <div class="slider fullscreen">
                            <ul class="slides">
                                <li>
                                    <img src="materialize/images/para1.jpg"> <!-- random image -->
                                    <div class="caption center-align">
                                        <h3>An app that is completely focused to improve user's recommendations.</h3>
                                        <h5 class="light grey-text text-lighten-3"></h5>
                                    </div>
                                </li>
                                <li>
                                    <img src="materialize/images/clip_image0012.jpg"> <!-- random image -->
                                    <div class="caption left-align">
                                        <h3>Books can be dangerous, the best ones should be labeled, “This could change your life.”</h3>
                                        <h5 class="light grey-text text-lighten-3"></h5>
                                    </div>
                                </li>
                                <li>
                                    <img src="materialize/images/parallax1.jpg"> <!-- random image -->
                                    <div class="caption right-align">
                                        <h3>“92% of respondents reported that a positive recommendation from a friend,
                                            family member, or someone they trust is the biggest influence on whether they buy a product or service.”
                                            ― Paul M. Rand</h3>
                                        <h5 class="light grey-text text-lighten-3"></h5>
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
                        <jsp:include page="loginmodal.jsp" ></jsp:include>
                        <jsp:include page="signuphandler.jsp" ></jsp:include>
                    </c:when>
                    <c:otherwise>
                        <c:redirect url="success.jsp"/>
                    </c:otherwise>
                </c:choose>
                <script src="materialize/js/index.js"></script>
            </div>
        </main>
        <footer class="section red darken-2 white-text center">
            <p>@2018 All right reserved. Shelf</p>
        </footer>
    </body>


</html>         