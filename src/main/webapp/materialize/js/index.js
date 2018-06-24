/* global checkForNotifications, checkNotifications */

$(document).ready(function () {
    setInterval(checkNotifications, 5000);

    $('input.autocomplete').autocomplete({
        data: {
            "Apple": null,
            "Microsoft": null,
            "Google": 'https://placehold.it/250x250'
        },
        limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
        onAutocomplete: function (val) {
            // Callback function when value is autcompleted.
        },
        minLength: 1 // The minimum length of the input for the autocomplete to start. Default: 1.
    });

    window.onresize = function (event) {
        var height = $(window).height() - 50;
        $(".main").height(height);
    };

    window.onload = function () {
        function checkRating() {
            var rating = document.ratingsform.value;
            document.getElementById("ratingalert").innerHTML = rating;
        }

    };
    //Initializations
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
    $('.slider').slider({
        interval: 6000,
        transition: 1000,
        indicators: false
    });





    //Account Information Dropdown Button
    $('.dropdown-button').dropdown({hover: true, constrainWidth: false});

    //For loading recommendations tab
    $('#showrecommendations').click(function () {
        $.ajax({url: 'recommendations.jsp#container', success: function (result) {
                $('#test-swipe-1').html(result);
                $('.scrollspy').scrollSpy();

            }});

    });
    /*
     *         $('#test-swipe-1').load('recommendations.jsp#container', function () {
     $('.scrollspy').scrollSpy();
     });
     */


    //For loading mybooks tab
    $('#mybooks').click(function () {
        $('#test-swipe-3').load('mybooks.jsp', function () {
        });

    });

    //For loading new arrivals tab
    $('#newarrivals').click(function () {
        $.ajax({url: 'arrivals.jsp#carousel', success: function (result) {
                $('#test-swipe-2').html(result);
                $('.scrollspy').scrollSpy();

            }});
    });




    var height = $(window).height() - 50;

    $('input#search').focus(function () {
        $(this).parent().addClass('focused');
    });
    $('input#search').blur(function () {
        if (!$(this).val()) {
            $(this).parent().removeClass('focused');
        }
    });



//    var edit = document.querySelector(".removeEdit");
//    edit.addEventListener('click', function () {
//        document.getElementById('fieldsetEnable').removeAttribute('disabled');
//        edit.classList.add('disabled');
//        edit.classList.remove('btn-floating');
//    });



    $('.input-field input').each(function () {
        ($(this).val() === '') ? $(this).addClass('empty') : $(this).removeClass('empty');
    });

    $('.input-field input').on('focus blur ', function () {
        ($(this).val() === '') ? $(this).addClass('empty') : $(this).removeClass('empty');
    });
});


//Login Modal width and height: responsive
$("#login").width($("#login").width());
$("#login").height($("#login").height());

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
    $('#login').modal('open');

});


//Function to open the signup modal
$(".login-register").click(function () {
    $("#login").modal('close');
    $("#signup").modal('open');
});


//Function for password validation
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
                } else if (emailID.toString() == "") {
                    document.getElementById("isE").style.color = "red";
                    document.getElementById("isE").innerHTML = "Cannot be empty";
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
function checkNotifications() {
    var xmlhttp = new XMLHttpRequest();
    var url = "checknotifications.jsp";
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            if (xmlhttp.responseText.endsWith("0")) {

            } else {
                document.getElementById("notificationcount").innerHTML = xmlhttp.responseText;
                document.getElementById("notification_badge").innerHTML = xmlhttp.responseText;
            }
        }
    };

}