/* global strength */

$(document).ready(function () {

    setTimeout(appReady, 2000);


    function appReady() {
        let appContainer = document.getElementById("spinnercon");
        while (appContainer.firstChild) {
            appContainer.removeChild(appContainer.firstChild);
        }

        let app = document.getElementById("recommendationlist");
        appContainer.appendChild(app);
    }
    var height = $(window).height() - 50;

    $('input#search').focus(function () {
        $(this).parent().addClass('focused');
    });
    $('input#search').blur(function () {
        if (!$(this).val()) {
            $(this).parent().removeClass('focused');
        }
    });
    $('.editbtn').removeClass("disabled");
    $('.modal').modal({opacity: .1, ending_top: '50%'});
    $('.collapsible').collapsible();
    $(".logo-collapse").sideNav();
    $('.parallax').parallax();
    $('.carousel').carousel();
    $('.tooltipped').tooltip({delay: 50});
    $('select').material_select();
    $('.parallax').parallax();
    $(".button-collapse").sideNav({
        menuWidth: 300, // Default is 300
        closeOnClick: true

    });



//    $("#icon_prefix").prop("disabled", true);
//    var enableSelection = function () {
//        $('.editform').removeClass("disabled");
//    };
//    $("#edit").on('click', enableSelection);
//    var disableSelection = function () {
//        
//    };
//    $("#editdone").on('click', disableSelection);

    var edit = document.querySelector(".removeEdit");
    edit.addEventListener('click', function () {
        document.getElementById('fieldsetEnable').removeAttribute('disabled');
        edit.classList.add('disabled');
        edit.classList.remove('btn-floating');
    });
//    var overlay = document.getElementById("overlay");
//    window.addEventListener('load', function () {
//        $('.overlay').fadeOut("slow");
//        overlay.style.display = 'none';
//    });



    $('.input-field input').each(function () {
        ($(this).val() === '') ? $(this).addClass('empty') : $(this).removeClass('empty');
    });

    $('.input-field input').on('focus blur ', function () {
        ($(this).val() === '') ? $(this).addClass('empty') : $(this).removeClass('empty');
    });
});

//Password Verification function
$("#password").on("keyup", function (e) {
    if ($(this).val() !== $("#checkpass").val() && $("#checkpass").val() !== "") {
        $("#checkpass").removeClass('valid').addClass('invalid');
    } else if ($("#checkpass").val() !== "") {
        $("#checkpass").removeClass('invalid').addClass('valid');
    }
});
$("#checkpass").on("keyup", function (e) {
    if (($("#password").val() !== $(this).val())) {
        $(this).removeClass('valid').addClass('invalid');
    } else {
        $(this).removeClass('invalid').addClass('valid');
    }
});

//Function to open the login modal if device/window width > 739 px
$(window).on("load", function () {
    if (window.innerWidth > 1024) {
        $('#login').modal('open');
    }
});

//Function to open the signup modal
$(".login-register").click(function () {
    $("#login").modal('close');
    $("#signup").modal('open');
});

var strength = {
    0: "Worst ☹",
    1: "Bad ☹",
    2: "Weak ☹",
    3: "Good ☺",
    4: "Strong ☻"
};
var password = document.getElementById('password');
var meter = document.getElementById('password-strength-meter');
var text = document.getElementById('password-strength-text');
password.addEventListener('input', function () {
    var val = password.value;
    var result = zxcvbn(val);

    // Update the password strength meter
    meter.value = result.score;

    // Update the text indicator
    if (val !== "") {
        text.innerHTML = "<div class=\"strength\"> Strength: " + "<strong>" + strength[result.score] + "</strong>" + "<span class='feedback'>" + result.feedback.warning + " " + result.feedback.suggestions + "</span></div>";
    } else {
        text.innerHTML = "";
    }
});
function checkExist() {
    var xmlhttp = new XMLHttpRequest();
    var emailID = document.forms["registration"]["email"].value;
    if (emailID.toString().endsWith("@")) {
        document.getElementById("isE").innerHTML = "";
    } else {
        var url = "exist.jsp?emailID=" + emailID;
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                if (xmlhttp.responseText.endsWith("ed")) {
                    document.getElementById("isE").style.color = "red";
                    document.getElementById("isE").innerHTML = xmlhttp.responseText;
                } else {
                    document.getElementById("isE").style.color = "green";
                    document.getElementById("isE").innerHTML = xmlhttp.responseText;
                }
            }
        };
        try {
            xmlhttp.open("GET", url, true);
            xmlhttp.send();
        } catch (e) {
            alert("Unable to connect to server");
        }
    }
}
(jQuery());
if (window.width <= 1000) {
    document.location = "123.html";
}