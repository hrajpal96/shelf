<%-- 
    Document   : sampleform
    Created on : 25 Mar, 2018, 5:17:51 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="basetemplate.jsp" %>
    </head>
    <body>
        <br>
        <br>
        <br>
        <div class="row">
            <form class="col s12">
                <div class="row">
                    <div class="input-field col s8">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="icon_prefix" type="text" class="validate" disabled="">
                        <label for="icon_prefix">First Name</label>
                        <a href="" id="edit" class="edit"><i class="material-icons suffix">create</i></a>
                    </div>


                    <div class="input-field col s6">
                        <i class="material-icons prefix">phone</i>
                        <input id="icon_telephone" type="tel" class="validate">
                        <label for="icon_telephone">Telephone</label>
                    </div>
                </div>
            </form>
        </div>
        <script src="js/index.js"></script>
    </body>
</html>
