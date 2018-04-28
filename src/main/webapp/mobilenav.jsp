<%-- 
    Document   : mobilenav
    Created on : 23 Apr, 2018, 12:59:56 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="mobilebase.html" %>
    <header>
        <%@include file="cachecontroller.jsp" %>
        <nav class="nav-extended ">
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo" ><h5>Shelf</h5></a>
                <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
                <ul class="right"> 
                    <li><a href="mobilelogin.jsp"><i class="material-icons">account_circle</i></a></li>
                </ul>
            </div>
            <div class="nav-content">
                <ul id="search" >
                    <form class="search-input black-text" action="search.do">
                        <div class="search-wrapper card">
                            <div class="input-field ">
                                <input id="search" type="search"  class="autocomplete" name="search" placeholder="Digital Fortress, The Alchemist"><i class="material-icons black-text">search</i>
                            </div>
                        </div>
                    </form>
                </ul>
                <br>
            </div>
        </nav>
    </header>
</html>
