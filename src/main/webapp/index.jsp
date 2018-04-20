<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Shelf</title>
        <%@include file="basetemplate.jsp" %>
    </head>
    <body>
        <%@include file="cachecontroller.jsp" %>
        <c:choose>
            <c:when test="${sessionScope.user eq null}">
                <%@include file="loginmodal.jsp" %>
                <%@include file="signuphandler.jsp" %>
                <main>
                    <div class="parallax-container">
                        <div class="parallax"><img src="materialize/images/para.jpg"></div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col m4 s12">
                                <div class="icon-block">
                                    <h2 class="center red-text">
                                        <i class="material-icons">local_library</i>  
                                    </h2>
                                    <h5 class="center">On the go access</h5>
                                    <p class="light">
                                        We did most of the heavy lifting for you to provide an easy, on the go access to a complete collection of books and recommendations tailored for a seamless users experience.
                                    </p>
                                </div>

                            </div>
                            <div class="col m4 s12">
                                <div class="icon-block">
                                    <h2 class="center red-text">
                                        <i class="material-icons">group</i>  
                                    </h2>
                                    <h5 class="center">User Experience Focused</h5>
                                    <p class="light">
                                        By utilizing elements and principles of Collaborative Filtering, we identify which books are best suited for you based on your reading habits to provide recommendations personalized for you.</p>
                                </div> 
                            </div>
                            <div class="col m4 s12">
                                <div class="icon-block">
                                    <h2 class="center red-text">
                                        <i class="material-icons">settings</i>  
                                    </h2>
                                    <h5 class="center">Easy to work with</h5>
                                    <p class="light">
                                        An uncluttered, bloat free interface with user centric functions at its core providing the features necessary to users and administrators of a library.
                                    </p>
                                </div> 
                            </div>
                        </div>
                    </div>
                    <div class="parallax-container">
                        <div class="parallax"><img src="materialize/images/parallax1.jpg"></div>
                    </div>
                    <div class="section white">
                        <div class="row container">
                            <h2 class="header">Recommendations</h2>
                            <p class="grey-text text-darken-3 lighten-3">Recommendations are an effective way of providing users with sugesstions with what they want.</p>
                        </div>
                    </div>
                    <div class="parallax-container">
                        <div class="parallax"><img src="materialize/images/parallax3.jpg"></div>
                    </div>
                </main>
            </c:when>
            <c:otherwise>
                <c:redirect url="success.jsp"/>
            </c:otherwise>
        </c:choose>
        <script src="js/zxcvbn.js"></script>
    </body>
</html>         