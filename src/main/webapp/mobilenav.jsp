<%-- 
    Document   : mobilenav
    Created on : 23 Apr, 2018, 12:59:56 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="mobilebase.html" %>
    <header><nav class="red accent-4">
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo" ><h5>Shelf</h5></a>
                <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
                <ul class="right"> 
                    <li><a href="mobilelogin.jsp"><i class="material-icons">account_circle</i></a></li>
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
                        <br>
                    </ul>
                </div>
            </div>
        </nav>
</html>
