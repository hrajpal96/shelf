<%-- 
    Document   : success
    Created on : 13 Mar, 2018, 4:13:52 PM
    Author     : Lenovo
--%>

<%@page import="com.shelf.session.UserBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.mahout.cf.taste.recommender.RecommendedItem"%>
<%@page import="java.util.List"%>
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
                <!--                <div id="test-swipe-1" class="col                         </div>-->
                <div id="test-swipe-1">
                    <div class="preloader-wrapper big active">
                        <div class="spinner-layer spinner-blue">
                            <div class="circle-clipper left">
                                <div class="circle"></div>
                            </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                        </div>

                        <div class="spinner-layer spinner-red">
                            <div class="circle-clipper left">
                                <div class="circle"></div>
                            </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                        </div>

                        <div class="spinner-layer spinner-yellow">
                            <div class="circle-clipper left">
                                <div class="circle"></div>
                            </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                        </div>

                        <div class="spinner-layer spinner-green">
                            <div class="circle-clipper left">
                                <div class="circle"></div>
                            </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                        </div>
                    </div>
                    <% 
                        if (session.getAttribute("Recommendations") != null) {
                    %>
                    <%
                        List< RecommendedItem> list = (List<RecommendedItem>) session.getAttribute("Recommendations");
                        Iterator<RecommendedItem> iter = list.iterator();
                        int size = list.size() - 1;
                    %>
                    <c:forEach items="${Recommendations}" var="listItem">
                        ${listItem}<br>
                    </c:forEach>
                    <%
                        }
                    %>
                </div>    
                <div id="test-swipe-2">
                    <main>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col m3">
                                    <div class="card cyan darken-4 white-text" id="sidecard">
                                        <div class="collapsible-header cyan darken-4"><center><h4 >Based on Preferences</h4></center></div>
                                        <div class="divider black-text"></div>
                                        <div id="sidecard-content">
                                            <div class="card small col m10 offset-m1">
                                                <div class="card-image waves-effect waves-block waves-light">
                                                    <img class="activator" src="images/abc.jpg">
                                                </div>
                                                <div class="card-content">
                                                    <span class="card-title activator grey-text text-darken-4">SEK & AWK Tools<i class="material-icons right">more_vert</i></span>
                                                    <p><a href="#">This is a link</a></p>
                                                </div>
                                                <div class="card-reveal">
                                                    <span class="card-title grey-text text-darken-4">SEK & AWK Tools<i class="material-icons right">close</i></span>
                                                    <p>Here is some more information about this product that is only revealed once clicked on.</p>
                                                </div>
                                            </div>
                                            <div class="card small col m10 offset-m1">
                                                <div class="card-image waves-effect waves-block waves-light">
                                                    <img class="activator" src="images/abc.jpg">
                                                </div>
                                                <div class="card-content">
                                                    <span class="card-title activator grey-text text-darken-4">Unix Programming<i class="material-icons right">more_vert</i></span>
                                                    <p><a href="#">This is a link</a></p>
                                                </div>
                                                <div class="card-reveal">
                                                    <span class="card-title grey-text text-darken-4">Unix Programming<i class="material-icons right">close</i></span>
                                                    <p>Here is some more information about this product that is only revealed once clicked on.</p>
                                                </div>
                                            </div>
                                            <div class="card small col m10 offset-m1">
                                                <div class="card-image waves-effect waves-block waves-light">
                                                    <img class="activator" src="images/abc.jpg">
                                                </div>
                                                <div class="card-content">
                                                    <span class="card-title activator grey-text text-darken-4">Core Java By Cay Hortsmann<i class="material-icons right">more_vert</i></span>
                                                    <p><a href="#">Open</a></p>
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
                                    <div class="card large amber darken-2">
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
                    </main>
                </div>
                <div id="test-swipe-3" class="col s12 ">
                    <div class="main">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col s12 m4">
                                    <div class="card blue white-text">
                                        <div class="card-content valign-wrapper">
                                            <div class="card-text">
                                                <h6>Title</h6>
                                                <p>I am a very simple card.</p>
                                            </div>
                                            <div class="card-icon">
                                                <i class="material-icons medium valign">description</i>
                                            </div>
                                        </div>
                                        <div class="card-action">
                                            <a href="#">View report</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col s12 m4">
                                    <div class="card cyan darken-4 white-text">
                                        <div class="card-content valign-wrapper">
                                            <div class="card-text">
                                                <h6>Title</h6>
                                                <p>I am a very simple card.</p>
                                            </div>
                                            <div class="card-icon">
                                                <i class="material-icons medium valign">check_circle</i>
                                            </div>
                                        </div>
                                        <div class="card-action">
                                            <a href="#">View report</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col s12 m4">
                                    <div class="card teal white-text">
                                        <div class="card-content valign-wrapper">
                                            <div class="card-text">
                                                <h6>Title</h6>
                                                <p>I am a very simple card.</p>
                                            </div>
                                            <div class="card-icon">
                                                <i class="material-icons medium valign">build</i>
                                            </div>
                                        </div>
                                        <div class="card-action">
                                            <a href="#">View report</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s12 m12">
                                    <div class="card">
                                        <table class="bordered highlight">
                                            <thead>
                                                <tr>
                                                    <th colspan="2">Group name</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Tradewinds Tours & Travel Pte Ltd</td>
                                                    <td class="right-align">90002515</td>
                                                </tr>
                                                <tr>
                                                    <td>Abacus Travel Systems Ptd Ltd</td>
                                                    <td class="right-align">90002515</td>
                                                </tr>
                                                <tr>
                                                    <td>Scoot Pte Ltd</td>
                                                    <td class="right-align">90002515</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <c:redirect url="index.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
</html>
