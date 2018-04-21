<%-- 
    Document   : mobilehome
    Created on : 21 Apr, 2018, 12:51:41 PM
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
        <%@include file="../cachecontroller.jsp" %>
        <%@include file="mobilebase.html" %>
        <nav class="red accent-4">
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo" ><h5>Shelf</h5></a>
                <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
                <ul class="right"> 
                    <li><a href="mobilelogin.jsp"><i class="material-icons">account_circle</i></a></li>
                </ul>
                <ul id="slide-out" class="side-nav">
                    <li class="search">
                        <div class="search-wrapper card ">
                            <input id="search"><i class="material-icons">search</i>
                            <div class="search-results"></div>
                        </div>
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
                    <li class="divider"></li>
                        <c:if test="${sessionScope.user ne null}">
                        <li><a href="#!">My Account</a></li>
                        <li><a href="#!">Notifications<span class = "new badge"></span></a></li>
                        <li><a href="#!">My Cart</a></li>

                    </c:if>
                    <li><a href="#!">About</a></li>
                    <li><a href="#!">Help</a></li>
                    <li><a href="#!">Privacy Policy</a></li>
                        <c:if test="${sessionScope.user ne null}">
                        <li><a href="logout.do">Logout</a></li>
                        </c:if>
                </ul>
            </div>
        </nav>


        <nav class="red accent-4">
            <div class="nav-wrapper">
                <div class="row">
                    <ul id="search" >
                        <form class="search-input black-text">
                            <div class="search-wrapper card">
                                <div class="input-field ">
                                    <input id="search" type="search"  name="search"/>
                                    <label for="search"><i class="material-icons black-text">search</i></label>
                                </div>
                            </div>
                        </form>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="carousel carousel-slider">
            <a class="carousel-item" href="#one!"><img src="materialize/images/parallax1_1.jpg"></a>
            <a class="carousel-item" href="#four!"><img src="materialize/images/parallax2_1_1.jpg"></a>
            <a class="carousel-item" href="#four!"><img src="materialize/images/parallax3_1.jpg"></a>
        </div> 

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


    </body>
</html>

