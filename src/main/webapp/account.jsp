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
        <title>My Account</title>
    </head>
    <body>
        <header>
            <%--<%@include file="basetemplate.jsp" %>--%>
            <%@include file="basetemplate.jsp" %>
            <%@include file="cachecontroller.jsp" %>
            <%@include file="checksession.jsp" %>
            <%@include file="changepassword.jsp" %>
        </header>

        <main>
            <div class="col s0.8" >&nbsp;</div>
            <div class="row">
                <div class="col s0.8" >&nbsp</div>
                <%@include file="templates/leftMyProfile.html" %>
                <style>
                    #toast-container {
                        top: auto !important;
                        right: auto !important;
                        bottom: 10%;
                        left:7%;  
                    }
                </style>
                <% if (session.getAttribute("isupdated") != null) {
                        if ((Boolean) session.getAttribute("isupdated")) {
                %>
                <script>Materialize.toast('Successfully Updated', 2000, 'bottom');</script>
                <%
                } else {
                %>
                <script>Materialize.toast('E-Mail ID or Phone number is already Registered', 3000, 'bottom')</script>
                <%
                        }
                        session.removeAttribute("isupdated");
                    }
                    if (session.getAttribute("passchanged") != null) {
                        if ((Boolean) session.getAttribute("passchanged") == true) {
                            session.removeAttribute("passchanged");
                %>
                <script>Materialize.toast('Password Changed successfully', 3000, 'bottom')</script>
                <%
                        }
                    }
                %>
                <div class="col s0.1" >&nbsp</div>
                <div class="card col s8">
                    <div class="col s10" >&nbsp</div>
                    <div class="col s2 offset s-10" style="padding-left: 83px"><a class="removeEdit halfway-fab btn-floating btn-large red text-darken-5"><i class="material-icons">edit</i></a></div>

                    <form action="updateprofile.do" method="POST">
                        <fieldset id="fieldsetEnable" disabled>
                            <div class="col s10"><h5 class="red-text text-darken-1 col s5">Personal Information</h5></div>
                            <div class="col s2" >&nbsp;</div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix red-text text-darken-5">account_circle</i>
                                <input id="icon_prefix" type="text" class="validate" name="first_name" value="${sessionScope.user.firstName}">
                                <label for="icon_prefix">First Name</label>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix red-text text-darken-5">account_circle</i>
                                <input id="icon_prefix" type="text" class="validate" name="last_name" value="${sessionScope.user.lastName}">
                                <label for="icon_prefix">Last Name</label>
                            </div>

                            <div class="col s12" >&nbsp;</div>
                            <div class="input-field col s6 email"> <i class="material-icons red-text prefix">email</i>
                                <input id="email" type="email" name="emailID" class="validate" onblur="checkExist()" value="${sessionScope.user.emailID}" required> 
                                <label for="email" class="tooltipped" data-tooltip="Enter a valid ID" data-position="top" data-delay="10" data-error="Please enter a valid email-ID." data-success="">Email</label>
                            </div>

                            <span id="isE"></span>


                            <div class="input-field col s6"> <i class="material-icons red-text prefix ">phone_iphone</i>
                                <input id="contactnumber"  type="tel"  name ="phone_num"  pattern="^[789]\d{9}$" value="${sessionScope.user.contactNumber}" class="validate" required>
                                <label for="contactnumber" class="tooltipped"  data-delay="10" data-tooltip ="Enter a valid 10-digit number" data-position="top" data-error="Enter a valid 10-digit number">Contact Number</label>
                            </div>
                            <div class="col s12" >&nbsp;</div>

                            <div class="input-field col s5"><i class="material-icons red-text prefix ">vpn_key</i>
                                <input id="password"  type="password"  name ="userpassword"   value="${sessionScope.user.password}" class="validate" required>
                                <label for="password" class="tooltipped"  data-delay="10">Password</label>
                            </div>
                            <div class="col s12" >&nbsp;</div>

                            <div  class="col s12" >
                                <button onclick="" class="btn waves-effect waves-light red darken-5"
                                        type="submit">Save<i class="material-icons left">save</i></button>
                            </div>

                        </fieldset>
                    </form>
                </div>
                <div class="col s12" >&nbsp;</div>
            </div>
            <script type="text/javascript" src="materialize/js/account.js"></script>
            <script src="materialize/js/index.js"></script>
        </main>
    </body>
</html>
