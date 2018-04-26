<%-- 
    Document   : mobilehome
    Created on : 21 Apr, 2018, 12:51:41 PM
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Shelf</title>
    </head>
    <%@include file="cachecontroller.jsp" %>
    <body>
        <%@include file="mobilenav.jsp" %>
        <main>
            <div class="slider">
                <ul class="slides">
                    <li>
                        <img src="materialize/images/para1.jpg"> <!-- random image -->
                        <div class="caption center-align">
                            <h3 class="flow-text">An app that is completely focused to improve user's recommendations.</h3>
                            <h5 class="light grey-text text-lighten-3 flow-text">Here's our small slogan.</h5>
                        </div>
                    </li>
                    <li>
                        <img src="materialize/images/para.jpg"> <!-- random image -->
                        <div class="caption left-align">
                            <h3 class="flow-text">Left Aligned Caption</h3>
                            <h5 class="light grey-text text-lighten-3 ">Here's our small slogan.</h5>
                        </div>
                    </li>
                    <li>
                        <img src="materialize/images/parallax1.jpg"> <!-- random image -->
                        <div class="caption right-align">
                            <h3 class="flow-text">Right Aligned Caption</h3>
                            <h5 class="light grey-text text-lighten-3 ">Here's our small slogan.</h5>
                        </div>
                    </li>
                    <li>
                        <img src="materialize/images/parallax1_1.png"> <!-- random image -->
                        <div class="caption center-align">
                            <h3 class="flow-text">This is our big Tagline!</h3>
                            <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                        </div>
                    </li>
                </ul>
            </div>
        </main>
        <ul id="slide-out" class="side-nav">
            <li class="search" >
                <form action="search.do">
                    <div class="search-wrapper card ">
                        <input id="search" name="search"><i class="material-icons" >search</i>
                        <div class="search-results"></div>
                    </div>
                </form>
            </li>
            <c:if test="${sessionScope.user ne null}">
                <li><div class="user-view">
                        <div class="background">
                            <img src="materialize/images/yuna.jpg">
                        </div>
                        <a href="#!user"><img class="circle" src="materialize/images/abc.jpg"></a>
                        <a href=""><span class="white-text name">${sessionScope.user.firstName}</span></a>
                        <a href=""><span class="white-text email">${sessionScope.user.emailID}</span></a>
                            <c:if test="${sessionScope.user eq null}">
                            <a href=""><span class="white-text email">Login</span></a>
                        </c:if>
                    </div>
                </li>
            </c:if>

        </li>
        <br>
        <br>
        <br>
        <br>
        <li class="divider"></li>
        <br>




        <c:if test="${sessionScope.user ne null}">
            <li><a href="#!"><i class="material-icons">account_circle</i>My Account</a></li>
            <li><a href="#!"><i class="material-icons">notifications</i>Notifications<span class = "new badge"></span></a></li>
            <li><a href="#!"><i class="material-icons">account_circle</i>My Cart</a></li>

        </c:if>
        <li><a href="#!"><i class="material-icons">info</i>About</a></li>
        <li><a href="#!"><i class="material-icons">help</i>Help</a></li>
        <li><a href="#!"><i class="material-icons">security</i>Privacy Policy</a></li>
            <c:if test="${sessionScope.user ne null}">
            <li><a href="logout.do"><i class="material-icons">keyboard_tab</i>Logout</a></li>
            </c:if>
    </ul>


    <footer class="page-footer white">
        <div class="container">
            <div class="row">
                <div class="col l6 s12">
                    <p class="grey-text text-darken-4">“A reader lives a thousand lives before he dies, said Jojen. The man who never reads lives only one.”
                        ― George R.R. Martin, A Dance with Dragons </p>
                </div>
                <div class="col l6 s12">

                    <ul>
                        <li><a class="grey-text text-darken-3" href="#!">About Us</a></li>
                        <li><a class="grey-text text-darken-3" href="#!">Help & Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-copyright grey-text text-darken-3">
            <div class="container" >

                © 2018 Shelf 
            </div>
        </div>
    </footer>

    <!--Import jQuery before materialize.js-->
    <script>
        $(".button-collapse").sideNav();
        $('.carousel.carousel-slider').carousel({
            fullWidth: true
        });

    </script>

    <script src="materialize/js/index.js"></script>
</body>
</html>

