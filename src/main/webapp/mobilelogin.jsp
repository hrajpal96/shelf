<%-- 
    Document   : mobilelogin
    Created on : 21 Apr, 2018, 3:08:46 PM
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="materialize/css/mobile.css">
</head>
<html>

    <body>
        <%@include file="mobilebase.html" %>

        <nav class="navbar-fixed">
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo"><h5>My Account</h5></a>
                <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
                <ul class="right"> 
                    <li><a href="notifications.html"><i class="material-icons">notifications</i></a></li>
                    <li><a href="cart.html"><i class="material-icons">shopping_cart</i></a></li>
                </ul>
            </div>
        </nav>
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
            <li class="divider">
            </li>
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
        <br>
        <br>
        <div class="row">
            <form  class="col s12" method="POST">

                <div class="row">
                    <div class="input-field col s12"> <i class="material-icons prefix">email</i>
                        <input id="email_field" type="email" name="emailID" class="validate" required>
                        <label for="email_field" >Email</label>

                    </div>
                    <div class="input-field col s12"> <i class="material-icons prefix ">lock</i>
                        <input  id="Pass" type="password" name ="password"  required>
                        <label for="Pass">Password</label>
                    </div>
                    <center>
                        <button class="btn waves-effect waves-light red accent-4 btn-block center-align" 
                                type="submit" formaction="login.do"  name="action">Log In <i class="material-icons left">lock_open</i> </button>
                        <br>
                        <br>
                        <br>
                        New to Shelf?<br><br>
                        <a class="login-register btn blue accent-4 modal-trigger" href="mobilesignup.jsp"  name="action">Sign Up <i class="material-icons left">person_add</i> </a>
                    </center>
                </div>

            </form>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        <script type="text/javascript" src="../materialize/js/index.js"></script> 
        <script>
            $(".button-collapse").sideNav();
        </script>
    </body>
</html>



