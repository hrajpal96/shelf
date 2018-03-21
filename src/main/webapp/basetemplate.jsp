<%-- 
    Document   : basetemplate
    Created on : 13 Mar, 2018, 2:59:37 PM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="base.html" %>
<div class="navbar-fixed">
    <c:choose>
        <c:when test="${sessionScope.user ne null}">
            <nav class="nav-extended"> 
            </c:when>
            <c:otherwise>
                <nav>
                </c:otherwise>
            </c:choose> 
            <div class="nav-wrapper red accent-4">
                <div class="row">
                    <div class="col s2">
                        <ul id="slide-out" class="side-nav">
                            <li><div class="user-view">
                                    <div class="background">
                                        <img src="images/yuna.jpg">
                                    </div>
                                    <c:if test="${sessionScope.user eq null}">
                                        <a href="#!user"><img class="circle" src="images/abc.jpg"></a>
                                        <a href="#!name"><span class="white-text name">${sessionScope.user.firstName}</span></a>
                                        <a href="#!email"><span class="white-text email">${sessionScope.user.firstName}</span></a>
                                    </div></li>
                                <li><a href="#!"><i class="material-icons">cloud</i>Notifications</a></li>
                                <li><a href="#!">Second Link</a></li>
                                <li><div class="divider"></div></li>
                                <li><a class="subheader">Subheader</a></li>
                                <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
                                </c:if>
                        </ul>
                        <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
                        <!--                <ul class="left hide-on-med-and-down">
                                        <li><a href="#" data-activates="slide-out" class="logo-collapse">My Shelf</a></li>
                                        </ul>-->
                    </div>
                    <div class="col s7">
                        <form class="search-input">
                            <div class="input-field">
                                <input id="search" type="search"  name="search"/>
                                <label for="search"><i class="material-icons">search</i></label>
                            </div>
                        </form>
                    </div>
                    <ul class="right hide-on-med-and-down">
                        <ul id="dropdown1" class="dropdown-content">
                            <li><a href="#!">My Account</a></li>
                            <li><a href="#!"><i class="material-icons">notifications</i>Notifications</a></li>
                            <li class="divider"></li>
                            <li><a href="logout.do">Logout</a></li>
                        </ul>
                        <c:choose>
                            <c:when test="${sessionScope.user ne null}">
                                <!--href for user left-->
                                <li><a class="dropdown-button" data-activates="dropdown1" href="#">${sessionScope.user.firstName}<i class="material-icons right">arrow_drop_down</i></a></li>
                                </c:when>
                                <c:otherwise>
                                <li><a class="modal-trigger" href="#login">Login</a></li>        
                                </c:otherwise>
                            </c:choose>
                        <li><a href="#">About</a></li>
                    </ul>
                </div>
                <c:if test="${sessionScope.user ne null}">
                    <div class="nav-content">
                        <ul id="tabs-swipe-demo" class="tabs tabs-transparent">
                            <li class="tab"><a href="#test-swipe-1">Recommendations</a></li>
                            <li class="tab"><a class="active" href="#test-swipe-2">New Arrivals</a></li>
                            <li class="tab"><a href="#test-swipe-3">My Books</a></li>
                        </ul>
                    </div>
                </c:if>
            </div>   
        </nav>    
</div>

<script src="js/index.js"></script>
<!-- nav end -->
