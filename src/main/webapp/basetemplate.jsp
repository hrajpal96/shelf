<%-- 
    Document   : basetemplate
    Created on : 13 Mar, 2018, 2:59:37 PM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="base.html" %>
<%@include file="cachecontroller.jsp" %>
<div class="navbar-fixed">
    <c:choose>
        <c:when test="${sessionScope.user ne null}">
            <ul id="dropdown1" class="dropdown-content">
                <li><a href="#!">My&nbsp;Account</a></li>
                <li><a href="#!"><span class = "new badge">4</span>Notifications</a></li>
                <li class="divider" tabindex="-1"></li>
                <li><a href="logout.do">Logout</a></li>
            </ul>
            <nav class="nav-extended"> 
            </c:when>
            <c:otherwise>
                <nav>
                </c:otherwise>
            </c:choose> 
            <div class="nav-wrapper red accent-4">
                <div class="row">
                    <div class="col s2">
                        <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
                        <!--                <ul class="left hide-on-med-and-down">
                                        <li><a href="#" data-activates="slide-out" class="logo-collapse">My Shelf</a></li>
                                        </ul>-->
                    </div>
                    <ul id="search hide-on-med-down" >
                        <div class="col s7">
                            <form class="search-input black-text">
                                <div class="search-wrapper card">
                                    <div class="input-field ">
                                        <input id="search" type="search"  name="search"/>
                                        <label for="search"><i class="material-icons black-text">search</i></label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </ul>
                    <ul class=" right hide-on-med-and-down">
                        <c:choose>
                            <c:when test="${sessionScope.user ne null}">
                                <!--href for user left-->
                                <li><a class="dropdown-button col-s4" data-activates="dropdown1" href="#"><span><i class="material-icons left">account_circle</i></span> ${sessionScope.user.firstName}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                <li><a class="modal-trigger" href="#login">Login</a></li>        
                                </c:otherwise>
                            </c:choose>
                    </ul>

                </div>
                <c:if test="${sessionScope.user ne null}">
                    <div class="nav-content">
                        <ul id="tabs-swipe-demo" class="tabs tabs-transparent">
                            <li class="tab"><a  href="#test-swipe-1">Recommendations</a></li>
                            <li class="tab"><a id="newarrivals" class="active" href="test-swipe-2">New Arrivals</a></li>
                            <li class="tab"><a href="#test-swipe-3">My Books</a></li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </nav>
</div>
<ul id="slide-out" class="side-nav">
    <li class="search">
        <div class="search-wrapper card ">
            <input id="search"><i class="material-icons">search</i>
            <div class="search-results"></div>
        </div>
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
<script src="materialize/js/index.js"></script>
