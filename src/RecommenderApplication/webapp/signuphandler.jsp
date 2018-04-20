<!--Account Modal Structure-->
<%@include file="base.html" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/zxcvbn/4.4.2/zxcvbn.js"></script>
<div id="signup" class="modal  fade s6">
    <div class="modal-fixed-header">
        <div class="collapsible-header btn white red accent-4 active"><i class="material-icons prefix ">account_circle</i>
            Sign Up
        </div>
    </div>
    <div class="modal-content">
        <div class="row">
            <form class="col s12" id="registration_form" method="POST" name="registration">
                <div class="row">
                    <div class="input-field "> <i class="material-icons prefix">person</i>
                        <input id="firstname" type="text" name="firstName" class="validate" required>
                        <label for="firstname">First Name</label>
                    </div>
                    <div class="input-field "> <i class="material-icons prefix">person_outline</i>
                        <input id="lastname" type="text" name="lastName" class="validate" required>
                        <label for="lastname">Last Name</label>
                        <span class="error_form" id="sname_error_message"></span>
                    </div>
                    <div class="input-field "> <i class="material-icons prefix">email</i>
                        <input id="email" type="email" name="emailID" class="validate" onblur="checkExist()" required>
                        <label for="email" class="tooltipped" data-tooltip="Enter a valid ID" data-position="top" data-delay="10" data-error="Please enter a valid email-ID." data-success="">Email</label>
                    </div>
                    <span id="isE"></span>

                    <div class="input-field "> <i class="material-icons prefix ">phone_iphone</i>
                        <input id="contactnumber"  type="tel"  name ="contactNumber"  pattern="^[789]\d{9}$" class="validate" required>
                        <label for="contactnumber" class="tooltipped"  data-delay="10" data-tooltip ="Enter a valid 10-digit number" data-position="top" data-error="Enter a valid 10-digit number">Contact Number</label>
                    </div>
                    <div class="input-field"> <i class="material-icons prefix ">lock_open</i>
                        <input id="password"   type="password" name ="password" required>
                        <label for="password" class="tooltipped" data-delay="30" data-tooltip ="Enter a 13-character Password" data-postition="bottom-right">Password</label>
                        <meter max="4" id="password-strength-meter"></meter>
                        <p id="password-strength-text"></p>
                    </div>
                    <div class="input-field "> <i class="material-icons prefix ">lock_outline</i>
                        <input  id="checkpass" type="password" name = "checkpass" class="validate" required>
                        <label for="checkpass" data-error="Passwords do not match" data-success="Passwords match" >Re-enter Password</label>

                    </div>
                    <div class="input-field" >
                        <i class="material-icons prefix ">list</i>
                        <select class="icons" multiple>
                            <option value="" disabled selected>Choose your domain preferences</option>
                            <option value="" data-icon="images/abc.png" class="right circle">example 1</option>
                            <option value="" data-icon="images/abc.jpg" class="right circle">example 2</option>
                            <option value="" data-icon="images/yuna.jpg" class="right circle">example 3</option>
                        </select>
                        <label >Your Preferences</label>
                    </div>
                    <div>
                        <center>

                            <button class="btn waves-effect waves-light red accent-4 btn-primary center-align" 
                                    type="submit" formaction="register.do"  name="action">Sign Up <i class="material-icons left">person_add</i> </button>
                        </center>
                    </div>
                </div>
            </form>
        </div>
        <p class="red-text">${message}</p>
        <script src="js/index.js"></script>
    </div>
</div>
