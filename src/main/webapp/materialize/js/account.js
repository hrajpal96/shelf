/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $("a").click(function () {
        var tar_id = $(this).attr("data-label");
        var tar = $("label[for='" + tar_id + "']");
        var val = tar.text();
        tar.replaceWith("<input type='text' name='" + tar_id + "' id='" + tar_id + "' value='" + val + "' class=\"\'validate\'\" required/>");
    });
});

