<%-- 
    Document   : productdetails.jsp
    Created on : 4 Apr, 2018, 1:50:34 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Details</title>
    </head>
    <body>
        <header>
            <%@include file="basetemplate.jsp" %>
            <c:if test="${sessionScope.user eq null}">
                <%@include file="loginmodal.jsp" %>
                <%@include file="signuphandler.jsp" %>
            </c:if>    
        </header>
        <br>
        <br>
        <br>
        <br>
        <br>
        <main>
            <center>
                <div class="row">
                    <img class="materialboxed responsive-img" width="350" height="450" src="<%= request.getParameter("coverpath")%>">
                    <h4><%= request.getParameter("bookname")%></h4>
                    <h4><%= request.getParameter("author")%></h4>
                </div>
            </center>
            <div class="container">
                <div class="hreview-aggregate">
                    <div class="row">
                        <div class="col s12 m6 l6">
                            <meta itemprop="worstRating" content="1">
                            <meta itemprop="bestRating" content="5">
                            <meta itemprop="reviewCount" content="1">
                            <div class="row">
                                <div class="score col s12">
                                    5
                                </div>
                                <div class="rating-stars col s12">
                                    <input type="radio" name="stars" id="star-null">
                                    <input type="radio" name="stars" id="star-1" saving="1" data-start="1" checked="">
                                    <input type="radio" name="stars" id="star-2" saving="2" data-start="2" checked="">
                                    <input type="radio" name="stars" id="star-3" saving="3" data-start="3" checked="">
                                    <input type="radio" name="stars" id="star-4" saving="4" data-start="4" checked="">
                                    <input type="radio" name="stars" id="star-5" saving="5" checked="">
                                    <section>
                                        <label for="star-1">
                                            <svg width="255" height="240" viewBox="0 0 51 48">
                                            <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                            </svg>
                                        </label>
                                        <label for="star-2">
                                            <svg width="255" height="240" viewBox="0 0 51 48">
                                            <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                            </svg>
                                        </label>
                                        <label for="star-3">
                                            <svg width="255" height="240" viewBox="0 0 51 48">
                                            <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                            </svg>
                                        </label>
                                        <label for="star-4">
                                            <svg width="255" height="240" viewBox="0 0 51 48">
                                            <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                            </svg>
                                        </label>
                                        <label for="star-5">
                                            <svg width="255" height="240" viewBox="0 0 51 48">
                                            <path d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"></path>
                                            </svg>
                                        </label>
                                    </section>
                                </div>
                                <div class="reviews-stats col s12">
                                    <span class="reviewers-small"></span>
                                    <span class="reviews-num">
                                        1
                                    </span> total
                                </div>
                            </div>
                        </div>
                        <div class="rating-histogram col s12 m6 l6">
                            <div class="rating-bar-container five">
                                <span class="bar-label">
                                    <span class="star-tiny">
                                    </span> 5
                                </span>
                                <span class="bar">
                                </span>
                                <span class="bar-number">
                                    0
                                </span>
                            </div>
                            <div class="rating-bar-container four">
                                <span class="bar-label">
                                    <span class="star-tiny">
                                    </span> 4
                                </span>
                                <span class="bar">
                                </span>
                                <span class="bar-number">
                                    1
                                </span>
                            </div>
                            <div class="rating-bar-container tree">
                                <span class="bar-label">
                                    <span class="star-tiny">
                                    </span> 3
                                </span>
                                <span class="bar">
                                </span>
                                <span class="bar-number">
                                    1
                                </span>
                            </div>
                            <div class="rating-bar-container two">
                                <span class="bar-label">
                                    <span class="star-tiny">
                                    </span> 2
                                </span>
                                <span class="bar">
                                </span>
                                <span class="bar-number">
                                    6
                                </span>
                            </div>
                            <div class="rating-bar-container one">
                                <span class="bar-label">
                                    <span class="star-tiny">
                                    </span> 1
                                </span>
                                <span class="bar">
                                </span>
                                <span class="bar-number">
                                    5
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
