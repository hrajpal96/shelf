<%-- 
    Document   : basetemplate
    Created on : 13 Mar, 2018, 2:59:37 PM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="base.html" ></jsp:include>
<jsp:include page="cachecontroller.jsp"></jsp:include>
    <body>    
        <div class="navbar-fixed">
        <c:choose>
            <c:when test="${sessionScope.user ne null}">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
                <script src="materialize/js/materialize.min.js"></script>
                <ul id="dropdown1" class="dropdown-content black-text">
                    <li><a href="account.jsp" class="black-text"><i class="material-icons">account_circle</i>Profile</a></li>
                    <li><a href="account.jsp"class="black-text"><i class="material-icons">settings</i>Settings</a></li>
                    <li class="divider" tabindex="-1"></li>
                    <li><a href="logout.do"class="black-text"><i class="material-icons">keyboard_tab</i>Logout</a></li>
                </ul>
                <div class="tap-target" data-activates="dropdown1">
                    <div class="tap-target-content">
                        <h5>Account Information and Settings</h5>
                        <p>Hey, you can click on the profile tab to view the the account information and logout from the drop-down here. :)</p>
                    </div>
                </div>
                <ul id="dropdown2" class="dropdown-content black-text">
                    <li><a href="notifications.jsp" id="notification_badge" class="black-text"><span class="new badge red">${sessionScope.notifications.getmessagecount}</span>&nbsp;&nbsp;Notifications</a></li>
                    <li class="divider"></li>
                    <li><a href="#!" class="black-text"><i class="medium material-icons circle yellow blue-text">shopping_cart</i>New Items in Cart</a></li>
                    <li><a href="#!" class="black-text"><i class="fa fa-inr small circl green-text"></i>Due Payments</a></li>
                    <li><a href="#!" class="black-text"><i class="medium material-icons circle blue white-text">library_books</i>New Recommendations</a></li>
                     
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
                            <a href="index.jsp" data-activates="slide-out" class="brand-logo hide-on-med-and-down"><img class="responsive-img" id="logo" src="materialize/images/shelfico.png"/></a>
                        </div>
                        <ul id="searchip" >
                            <div class="col s7">
                                <form class="search-input black-text" action="search.do">
                                    <div class="search-wrapper card">
                                        <div class="input-field ">
                                            <input id="search" type="search"  formaction="_self" class="autocomplete" name="search" placeholder="Digital Fortress, The Alchemist"><i class="material-icons black-text">search</i>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </ul>
                        <ul class=" right hide-on-med-and-down">
                            <c:choose>
                                <c:when test="${sessionScope.user ne null}">
                                    <li><a id="notificationcount" class="dropdown-button col-s4" data-activates="dropdown2" href="#"><i class="material-icons">notifications_none</i></a></li>
                                    <li><a class="dropdown-button col-s4" data-activates="dropdown1" href="#"><span><i class="material-icons left">account_circle</i></span> ${sessionScope.user.firstName}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                    <li><a class="modal-trigger" id="log" href="#login">Login</a></li>        
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </div>
                    <c:if test="${sessionScope.user ne null}">
                        <div class="nav-content fixed">
                            <ul id="tabs-swipe-demo" class="tabs tabs-transparent">
                                <li class="tab col s3"><a id="newarrivals" class="active" href="#test-swipe-2">New Arrivals</a></li>
                                <li class="tab col s3"><a id="showrecommendations" href="#test-swipe-1">Recommendations</a></li>
                                <li class="tab col s3"><a id="mybooks" href="#test-swipe-3">My Books</a></li>
                                <li class="tab col s3"><a id="searchtab" href="#test-swipe-4">Search</a></li>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </nav>
    </div>
    <ul id="slide-out" class="side-nav">
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
                <c:if test="${sessionScope.user eq null}">
                    <a href=""><span class="white-text name">Login</span></a>
                </c:if>
            </div>
        </li>
        <br>
        <br>
        <li class="divider"></li>
        <li class="search">
            <form action="search.do">
                <div class="search-wrapper card ">
                    <input id="search" name="search"><i class="material-icons">search</i>
                    <div class="search-results"></div>
                </div>
            </form>
        </li>
        <c:if test="${sessionScope.user ne null}">

            <li><a href="account.jsp"><i class="material-icons">account_circle</i>My Profile</a></li>
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
    <script src="materialize/js/mobileredirect.js"></script>
</body>
