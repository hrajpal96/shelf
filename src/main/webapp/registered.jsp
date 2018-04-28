<%-- 
    Document   : registered
    Created on : 23 Mar, 2018, 4:50:16 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration Successful</title>
        <jsp:include page="base.html" ></jsp:include>
    </head>
    <body>
        <div class="row">
            <div class="col m6 offset-m3" style="margin-top: 10%">
                <div class="card ">
                    <center>
                        <div class="card-content black-text">
                            <p>Congratulations</p>
                            <div class="green-text">
                                <i class="material-icons large">playlist_add_check</i>
                            </div>
                            <p>You've been successfully registered.</p>
                            <p>A verification email has been sent to your registered email account.</p>
                            <a href="index.jsp" class="large blue-text">Continue to Sign In</a>
                        </div>
                    </center>
                </div>
            </div>
        </div>
    </body>
</html>
