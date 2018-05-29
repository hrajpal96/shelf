<%-- 
    Document   : changepassword
    Created on : 14 Mar, 2018, 11:17:24 AM
    Author     : Lenovo
--%>

<!--Password Updation Modal-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="base.html" ></jsp:include>
<jsp:include page="cachecontroller.jsp" ></jsp:include>
<div id="changepassword" class="modal" style="width: 30%">
    <div class="body">
        <center>
            <div class="row modal-form-row">
                <form class="col s12" id="passwordform" method="POST" name="passwordform" >
                    <div class='row'>
                        <div class='col s12'>
                        </div>
                    </div>

                    <div class='row'>
                        <div class='input-field'><i class="material-icons prefix ">lock</i>
                            <input  id="Pass" type="password" name ="password"  required>
                            <label for="Pass">Current Password</label>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='input-field'><i class="material-icons prefix ">lock</i>
                            <input  id="pass" type="password" name ="newpassword"  required>
                            <label for="pass">New Password</label>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='input-field'><i class="material-icons prefix ">lock</i>
                            <input  id="checkpassword" type="password" name ="confirmpassword"  required>
                            <label for="checkpassword" data-error="Passwords do not match" data-success="Passwords match" >Re-enter New Password</label>
                        </div>
                    </div>
                    <center>
                        <div class='row col s12'>
                            <button type='submit' formaction="changepassword.do" name='btn_changepass' class=' btn btn-primary waves-effect indigo'>Change Password</button>
                        </div>
                    </center>
                </form>
            </div>
        </center>
    </div>
</div>
<script src="materialize/js/mobileredirect.js"></script>
<script src="materialize/js/account.js"></script>

