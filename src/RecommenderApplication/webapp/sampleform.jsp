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
        <%@include file="cachecontroller.jsp" %>


    </head>
    <body>
        <%@include file="basetemplate.jsp" %>
        <script src="js/index.js"></script>
        <br>
        <br>
        <br>
        <br>
        <div class="card col m2">
            <form action="" class="col m2 col offset-m1" method="POST" >
                <a class="halfway-fab btn-floating btn-large waves-effect waves-light red removeEdit"><i class="material-icons" >edit</i></a>

                <fieldset id="fieldsetEnable" disabled>
                    <div class="row">
                        <div class="input-field "> <i class="material-icons prefix">person</i>
                            <input id="firstname" type="text" name="firstName" class="validate" required >
                            <label for="firstname">First Name</label>
                        </div>
                        <div class="input-field "> <i class="material-icons prefix">person_outline</i>
                            <input id="lastname" type="text" name="lastName" class="validate" required >
                            <label for="lastname">Last Name</label>
                            <span class="error_form" id="sname_error_message"></span>
                        </div>
                        <div class="input-field "> <i class="material-icons prefix">email</i>
                            <input id="email" type="email" name="emailID" class="validate" onblur="checkExist()" required >
                            <label for="email" class="tooltipped" data-tooltip="Enter a valid ID" data-position="top" data-delay="10" data-error="Please enter a valid email-ID." data-success="">Email</label>
                        </div>
                        <span id="isE"></span>
                        <div class="input-field "> <i class="material-icons prefix ">phone_iphone</i>
                            <input id="contactnumber"  type="tel"  name ="contactNumber"  pattern="^[789]\d{9}$" class="validate" required >
                            <label for="contactnumber" class="tooltipped"  data-delay="10" data-tooltip ="Enter a valid 10-digit number" data-position="top" data-error="Enter a valid 10-digit number">Contact Number</label>
                        </div>
                        <div class="input-field" >
                            <i class="material-icons prefix ">list</i>
                            <select class="icons" multiple>
                                <option value="" disabled selected>Shelf recommends the best content to suit your needs. Pick 3 topics you want to learn about. (You can change these later.)</option>
                                <option value="" data-icon="images/abc.png" class="right circle">example 1</option>
                                <option value="" data-icon="images/abc.jpg" class="right circle">example 2</option>
                                <option value="" data-icon="images/yuna.jpg" class="right circle">example 3</option>

                            </select>
                            <label >Preferences</label>
                        </div>
                        <div>
                            <center>
                                <button id="editdone" class="btn waves-effect waves-light red accent-4 btn-primary center-align" 
                                        type="submit" formaction="register.do"  name="action">Save <i class="material-icons left">person_add</i> </button>
                            </center>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        <!--</div>-->
        <!--</p>-->
    </body>
</html>
