<%-- 
    Document   : notfound
    Created on : 20 Apr, 2018, 10:31:16 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <title>Humans do make mistakes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <jsp:include page="base.html" ></jsp:include>
    <body background="materialize/images/008-404_asis_patel-x2.gif" class="responsive-img">
    <center>

        <h1 class="white-text text-center">Oops Look like we are lost</h1>
        <form action="index.jsp" method="GET"> 
            <button class="btn waves-effect waves-light white btn-primary center-align black-text" 
                    type="submit"  name="action">Let's get back home <i class="material-icons left">home</i> </button>
        </form>
    </center>
</body>
</html>

