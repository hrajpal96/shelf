<%-- 
    Document   : signinhandler
    Created on : 14 Mar, 2018, 11:17:24 AM
    Author     : Lenovo
--%>

<!--Account Modal Structure-->
<%@include file="cachecontroller.jsp" %>
<div id="login" class="modal">
    <div class="collapsible-header btn red accent-4 active"><i class="material-icons prefix ">account_circle</i>
        Sign In
    </div>
    <br>
    <div class="body">
        <div class="row modal-form-row">
            <form id="loginform" class="col s12" method="POST" name="loginform">
                <div class="row">
                    <div class="input-field"> <i class="material-icons prefix">email</i>
                        <input id="email_field" type="email" name="emailID" class="validate" required>
                        <label for="email_field" >Email</label>

                    </div>
                    <div class="input-field"> <i class="material-icons prefix ">lock</i>
                        <input  id="Pass" type="password" name ="password"  required>
                        <label for="Pass">Password</label>
                    </div>
                    <div>
                        <center>
                            <button class="btn waves-effect waves-light red accent-4 btn-block center-align" 
                                    type="submit" formaction="login.do"  name="action">Log In <i class="material-icons left">lock_open</i> </button>
                            <a class="login-register btn waves-effect waves-light red accent-4 modal-trigger" href="#signup"  name="action">Sign Up <i class="material-icons left">person_add</i> </a>
                        </center>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<script src="js/index.js"></script>

