<%-- 
    Document   : signinhandler
    Created on : 14 Mar, 2018, 11:17:24 AM
    Author     : Lenovo
--%>

<!--Account Modal Structure-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="base.html" ></jsp:include>
<jsp:include page="cachecontroller.jsp" ></jsp:include>
    <div id="login" class="modal">
        <div class="collapsible-header btn red accent-4 active"><i class="material-icons prefix ">account_circle</i>
            Sign In
        </div>
        <div class="body">
            <center>
            <c:if test="${requestScope.pass eq 'incorrect'}">
                <br><div class="red-text">Either E-Mail ID or password is incorrect!</div>
            </c:if>
            <style>
                .input-field input[type=date]:focus + label,
                .input-field input[type=text]:focus + label,
                .input-field input[type=email]:focus + label,
                .input-field input[type=password]:focus + label {
                    color: #1a237e;
                }
                .input-field input[type=date]:focus,
                .input-field input[type=text]:focus,
                .input-field input[type=email]:focus,
                .input-field input[type=password]:focus {
                    border-bottom: 2px solid #1a237e;
                    box-shadow: none;
                }
            </style>
            <div class="row modal-form-row">
                <form class="col s12" id="loginform" method="POST" name="loginform">
                    <div class='row'>
                        <div class='col s12'>
                        </div>
                    </div>

                    <div class='row'>
                        <div class='input-field '><i class="material-icons prefix ">email</i>
                            <input id="email_field" type="email" name="emailID" class="validate" required>
                            <label for="email_field" >Email</label>
                        </div>
                    </div>

                    <div class='row'>
                        <div class='input-field'><i class="material-icons prefix ">lock</i>
                            <input  id="Pass" type="password" name ="password"  required>
                            <label for="Pass">Password</label>
                        </div>
                        <label style='float: right;'>
                            <a class='green-text' href='#!'><b>Forgot Password?</b></a>
                        </label>
                    </div>
                    <center>
                        <div class='row'>
                            <button type='submit' onclick="checkNotifications()" formaction="login.do" name='btn_login' class='col s12 btn btn-large waves-effect indigo'>Login</button>
                        </div>
                    </center>
                </form>
            </div>
            <a href="#signup" class="login-register">Create account</a>
        </center><br>
    </div>
</div>
<script src="materialize/js/mobileredirect.js"></script>
<script src="materialize/js/index.js"></script>

