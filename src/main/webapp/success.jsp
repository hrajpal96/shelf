<%-- 
    Document   : success
    Created on : 13 Mar, 2018, 4:13:52 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${sessionScope.user.firstName}-Dashboard</title>
        <%@include file="basetemplate.jsp" %>
    </head>
    <body>
        <%@include file="cachecontroller.jsp" %>
        <c:choose>
            <c:when test="${sessionScope.user ne null}">
                <h3>Welcome, ${sessionScope.user.firstName}</h3>
                <div id="test-swipe-1" class="col s12 blue">Test 1</div>
                <div id="test-swipe-2">
                    <div class="row">
                        <div class="col m3">
                            <div class="card  blue-grey darken-4 white-text" id="sidecard">
                                <div class="collapsible-header blue-grey darken-4"><center><h4 >Based on Preferences</h4></center></div>
                                <div class="divider"></div>
                                <div id="sidecard-content">
                                    <div class="card small col m10 offset-m1">
                                        <div class="card-image waves-effect waves-block waves-light">
                                            <img class="activator" src="images/abc.jpg">
                                        </div>
                                        <div class="card-content">
                                            <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
                                            <p><a href="#">This is a link</a></p>
                                        </div>
                                        <div class="card-reveal">
                                            <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
                                            <p>Here is some more information about this product that is only revealed once clicked on.</p>
                                        </div>
                                    </div>
                                    <div class="card small col m10 offset-m1">
                                        <div class="card-image waves-effect waves-block waves-light">
                                            <img class="activator" src="images/abc.jpg">
                                        </div>
                                        <div class="card-content">
                                            <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
                                            <p><a href="#">This is a link</a></p>
                                        </div>
                                        <div class="card-reveal">
                                            <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
                                            <p>Here is some more information about this product that is only revealed once clicked on.</p>
                                        </div>
                                    </div>
                                    <div class="card small col m10 offset-m1">
                                        <div class="card-image waves-effect waves-block waves-light">
                                            <img class="activator" src="images/abc.jpg">
                                        </div>
                                        <div class="card-content">
                                            <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
                                            <p><a href="#">This is a link</a></p>
                                        </div>
                                        <div class="card-reveal">
                                            <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
                                            <p>Here is some more information about this product that is only revealed once clicked on.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col m9">
                            <div class="card large blue-grey darken-4">
                                <div class="carousel  white-text">
                                    <center><h3>New Arrivals</h3></center>
                                    <a class="carousel-item" href="#one!"><img src="images/parallax1.jpg"><center>N1</center></a>
                                    <a class="carousel-item" href="#two!"><img src="images/parallax3.jpg">N2</a>
                                    <a class="carousel-item" href="#three!"><img src="images/abc.jpg">N3</a>
                                    <a class="carousel-item" href="#four!"><img src="images/parallax2.jpg">N4</a>
                                    <a class="carousel-item" href="#five!"><img src="images/yuna.jpg">N5</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="test-swipe-3" class="col s12 green">Test 3</div>
            </c:when>
            <c:otherwise>
                <c:redirect url="index.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
</html>
