/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var edit = document.querySelector('.removeEdit');
var email = document.querySelector('.email');
edit.addEventListener('click', function () {
    document.querySelector('#fieldsetEnable').removeAttribute('disabled');
    $('input[type="email"]').attr("disabled", "disabled");
    $('input[type="password"]').attr("disabled", "disabled");
    $('a').removeClass("disabled");
    edit.classList.add('disabled');
    edit.classList.remove('btn');
    edit.classList.remove('btn-flat');
    document.querySelector('.removeEdit').textContent = "";
});


$(".change-password").click(function () {
    $("#changepassword").modal('open');
});

//Password Verification function
$("#pass").on("keyup", function (e) {
    if ($(this).val() !== $("#checkpass").val() && $("#checkpassword").val() !== "") {
        $("#checkpassword").removeClass('valid').addClass('invalid');
    } else if ($("#checkpassword").val() !== "") {
        $("#checkpassword").removeClass('invalid').addClass('valid');
    }
});
$("#checkpassword").on("keyup", function (e) {
    if (($("#pass").val() !== $(this).val())) {
        $(this).removeClass('valid').addClass('invalid');
    } else {
        $(this).removeClass('invalid').addClass('valid');
    }
});